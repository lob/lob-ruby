require_relative "resource"

module Lob
  module V1
    class Address < Lob::V1::Resource

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
