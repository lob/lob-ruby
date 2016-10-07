require "lob/resources/resource_base"

module Lob
  module Resources
    class Address < Lob::Resources::ResourceBase

      def initialize(config)
        super(config)
        @endpoint = "addresses"
      end

      def verify(options={})
        submit :post, address_verify_url, options
      end

      private

      def address_verify_url
        "#{base_url}/verify"
      end

    end
  end
end
