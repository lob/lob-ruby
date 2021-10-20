require "lob/resources/resource_base"

module Lob
  module Resources
    class Card < Lob::Resources::ResourceBase

      def initialize(config)
        super(config)
        @endpoint = "cards"
      end
      
      def update(resource_id, body={}, headers={})
        request = {
          method: :post,
          url: resource_url(resource_id),
          body: body,
          headers: headers
        }

        submit(request)
      end

      def create_order(resource_id, body={}, headers={})
        request = {
          method: :post,
          url: "#{resource_url(resource_id)}/orders",
          body: body,
          headers: headers
        }

        submit(request)
      end

      def list_orders(resource_id, query={})
        request = {
          method: :get,
          url: "#{resource_url(resource_id)}/orders",
          query: query
        }

        submit(request)
      end

    end
  end
end
