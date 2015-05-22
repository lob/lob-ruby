module Lob
  module V1
    class Address

      def initialize(resource)
        @resource = resource
      end

      def verify(options={})
        Lob.submit(:post, address_verify_url, options)
      end

      def list(options={})
        Lob.submit(:get, address_url, options)
      end

      def find(address_id)
        Lob.submit :get, address_url(address_id)
      end

      def create(options = {})
        Lob.submit :post, address_url, options
      end

      def destroy(address_id)
        Lob.submit :delete, address_url(address_id)
      end

      private

      def address_url(address_id = nil)
        @resource.construct_url("addresses", address_id)
      end

      def address_verify_url
        @resource.construct_url("verify")
      end

    end
  end
end
