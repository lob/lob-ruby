require "rest-client"
require "json"
require "uri"

module Lob
  module V1
    class Resource

      attr_reader :config, :endpoint

      def initialize(config)
        @config = config
      end

      def list(options={})
        submit :get, endpoint_url, options
      end

      def find(resource_id)
        submit :get, resource_url(resource_id)
      end

      def create(options = {})
        submit :post, endpoint_url, options
      end

      def destroy(resource_id)
        submit :delete, resource_url(resource_id)
      end

      private

      def submit(method, url, parameters={})
        clientVersion = Lob::VERSION

        begin
          if method == :get || method == :delete
            # Hack to URL encode nested objects like metadata.
            url = "#{url}?#{build_nested_query(parameters)}"
            response = RestClient.send(method, url, {
              user_agent: 'Lob/v1 RubyBindings/' + clientVersion,
              "Lob-Version" => config[:api_version]
            })
          else
            response = RestClient.send(method, url, parameters, {
              user_agent: 'Lob/v1 RubyBindings/' + clientVersion,
              "Lob-Version" => config[:api_version]
            })
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
        "#{config[:protocol]}://#{config[:api_key]}:@#{config[:api_host]}/v1"
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
