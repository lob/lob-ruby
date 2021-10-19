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

    end
  end
end
