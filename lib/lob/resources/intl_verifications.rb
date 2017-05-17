require "lob/resources/resource_base"

module Lob
  module Resources
    class IntlVerifications < Lob::Resources::ResourceBase

      undef_method :list, :find, :create, :destroy

      def initialize(config)
        super(config)
        @endpoint = "intl_verifications"
      end

      def verify(options={})
        submit :post, endpoint_url, options
      end

    end
  end
end
