require "rest-client"
require "json"
require "uri"

module Lob
  module Resources
    class ResourceBase

      attr_reader :config, :endpoint

      def initialize(config)
        @config = config
      end

      def list(query={})
        request = {
          method: :get,
          url: endpoint_url,
          query: query
        }

        submit(request)
      end

      def find(resource_id)
        request = {
          method: :get,
          url: resource_url(resource_id)
        }

        submit(request)
      end

      def create(body={}, headers={}, query={})
        request = {
          method: :post,
          url: endpoint_url,
          body: body,
          headers: headers,
          query: query
        }

        submit(request)
      end

      def destroy(resource_id)
        request = {
          method: :delete,
          url: resource_url(resource_id)
        }

        submit(request)
      end

      private

      def submit(request)
        clientVersion = Lob::VERSION

        url     = request[:url]
        method  = request[:method]
        body    = request[:body] || {}
        query   = request[:query] || {}
        headers = request[:headers] || {}

        headers = headers.merge({
          user_agent: 'Lob/v1 RubyBindings/' + clientVersion,
          "Lob-Version" => config[:api_version]
        })

        if query != {}
          url = "#{url}?#{build_nested_query(query)}"
        end
        
        begin
          if method == :get || method == :delete
            response = RestClient.send(method, url, headers)
          else
            if body[:merge_variables] and body[:merge_variables].class == Hash
              body[:merge_variables] = body[:merge_variables].to_json()
            end
            response = RestClient.send(method, url, body, headers)
          end

          body = JSON.parse(response)

          body.define_singleton_method(:_response) do
            response
          end

          return body

        rescue RestClient::ExceptionWithResponse => e
          handle_api_error(e)
        end
      end

      private

      def handle_api_error(error)
        begin
          response = JSON.parse(error.http_body.to_s)
          message = response.fetch("error").fetch("message")
          raise InvalidRequestError.new(message, error.http_code, error.http_body, error.response)
        rescue JSON::ParserError, KeyError
          # :nocov:
          raise LobError.new("Invalid response object:", error.http_code, error.http_body)
          # :nocov:
        end
      end

      def build_nested_query(value, prefix = nil)
        case value
        when Array
          value.map { |v|
            build_nested_query(v, "#{prefix}[]")
          }.join("&")
        when Hash
          value.map { |k, v|
            build_nested_query(v, prefix ? "#{prefix}[#{URI.encode_www_form_component(k)}]" : URI.encode_www_form_component(k))
          }.reject(&:empty?).join('&')
        else
          raise ArgumentError, "value must be an Array or Hash" if prefix.nil?
          "#{prefix}=#{URI.encode_www_form_component(value)}"
        end
      end

      def base_url
        "https://#{config[:api_key]}:@api.lob.com/v1"
      end

      def endpoint_url
        "#{base_url}/#{endpoint}"
      end

      def resource_url(resource_id)
        "#{endpoint_url}/#{resource_id}"
      end

    end
  end
end
