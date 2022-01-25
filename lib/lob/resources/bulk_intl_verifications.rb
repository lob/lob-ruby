require "lob/resources/resource_base"

module Lob
  module Resources
    class BulkIntlVerifications < Lob::Resources::ResourceBase

      undef_method :list, :find, :create, :destroy

      def initialize(config)
        super(config)
        @endpoint = "bulk/intl_verifications"
      end

      def verify(body={})
        body[:addresses] = body[:addresses].to_json
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
