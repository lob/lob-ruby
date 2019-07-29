require "rest-client"
require "json"
require "uri"

module Lob
  module Resources
    class Member < Lob::Resources::ResourceBase

      attr_reader :config, :endpoint

      def initialize(config)
        super(config)
        @endpoint = "members"
      end

      def list(group_id, query={})
        request = {
          method: :get,
          url: endpoint_url(group_id),
          query: query
        }

        submit request
      end

      def find(group_id, resource_id)
        request = {
          method: :get,
          url: resource_url(group_id, resource_id)
        }

        submit request
      end

      def create(group_id, body={}, headers={}, query={})
        request = {
          method: :post,
          url: endpoint_url(group_id),
          body: body,
          headers: headers,
          query: query
        }

        submit request
      end

      def destroy(group_id, resource_id)
        request = {
          method: :delete,
          url: resource_url(group_id, resource_id)
        }

        submit request
      end

      # private

      # def submit(request)
      #   clientVersion = Lob::VERSION

      #   url     = request[:url]
      #   method  = request[:method]
      #   body    = request[:body] || {}
      #   query   = request[:query] || {}
      #   headers = request[:headers] || {}

      #   headers = headers.merge({
      #     user_agent: 'Lob/v1 RubyBindings/' + clientVersion,
      #     "Lob-Version" => config[:api_version]
      #   })

      #   if query != {}
      #     url = "#{url}?#{build_nested_query(query)}"
      #   end

      #   begin
      #     if method == :get || method == :delete
      #       response = RestClient.send(method, url, headers)
      #     else
      #       response = RestClient.send(method, url, body, headers)
      #     end

      #     body = JSON.parse(response)

      #     body.define_singleton_method(:_response) do
      #       response
      #     end

      #     return body

      #   rescue RestClient::ExceptionWithResponse => e
      #     handle_api_error(e)
      #   end
      # end

      # private

      # def handle_api_error(error)
      #   begin
      #     response = JSON.parse(error.http_body.to_s)
      #     message = response.fetch("error").fetch("message")
      #     raise InvalidRequestError.new(message, error.http_code, error.http_body, error.response)
      #   rescue JSON::ParserError, KeyError
      #     # :nocov:
      #     raise LobError.new("Invalid response object:", error.http_code, error.http_body)
      #     # :nocov:
      #   end
      # end

      def endpoint_url(group_id)
        "#{base_url}/groups/#{group_id}/#{endpoint}"
      end

      def resource_url(group_id, resource_id)
        "#{endpoint_url(group_id)}/#{resource_id}"
      end

    end
  end
end
