require "lob/resources/resource_base"

module Lob
  module Resources
    class USVerifications < Lob::Resources::ResourceBase

      undef_method :list, :find, :create, :destroy

      def initialize(config)
        super(config)
        @endpoint = "us_verifications"
      end

      def verify(options={})
        submit :post, endpoint_url, options
      end

    end
  end
end
