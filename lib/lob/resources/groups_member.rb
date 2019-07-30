require "rest-client"
require "json"
require "uri"

module Lob
  module Resources
    class GroupsMember < Lob::Resources::ResourceBase

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

      def endpoint_url(group_id)
        "#{base_url}/groups/#{group_id}/#{endpoint}"
      end

      def resource_url(group_id, resource_id)
        "#{endpoint_url(group_id)}/#{resource_id}"
      end

    end
  end
end
