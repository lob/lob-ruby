require "lob/resources/resource_base"

module Lob
  module Resources
    class USZipLookups < Lob::Resources::ResourceBase

      undef_method :list, :find, :create, :destroy

      def initialize(config)
        super(config)
        @endpoint = "us_zip_lookups"
      end

      def lookup(body={})
        request = {
          method: :post,
          url: endpoint_url,
          body: body
        }

        submit request
      end

    end
  end
end
