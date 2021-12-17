require "lob/resources/resource_base"

module Lob
  module Resources
    class BulkUSVerifications < Lob::Resources::ResourceBase

      undef_method :list, :find, :create, :destroy

      def initialize(config)
        super(config)
        @endpoint = "bulk/us_verifications"
      end

      def verify(body={}, query={})
        request = {
          method: :post,
          url: endpoint_url,
          body: body,
          query: query
        }

        submit request
      end

    end
  end
end
