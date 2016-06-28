module Lob
  module V1
    class Postcard

      def initialize(resource)
        @resource = resource
      end

      def list(options={})
        Lob.submit(:get, postcard_url, options)
      end

      def find(postcard_id)
        Lob.submit :get, postcard_url(postcard_id)
      end

      def create(options = {})
        Lob.submit :post, postcard_url, options
      end

      def destroy(postcard_id)
        Lob.submit :delete, postcard_url(postcard_id)
      end

      private

      def postcard_url(postcard_id = nil)
        @resource.construct_url("postcards", postcard_id)
      end

    end
  end
end
