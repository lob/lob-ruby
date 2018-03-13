require "lob/resources/resource_base"

module Lob
  module Resources
    class USVerifications < Lob::Resources::ResourceBase

      undef_method :list, :find, :create, :destroy

      def initialize(config)
        super(config)
        @endpoint = "us_verifications"
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
