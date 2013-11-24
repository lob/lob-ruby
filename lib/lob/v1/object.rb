module Lob
  module V1
    class Object

      def initialize(resource)
        @resource = resource
      end

      def list(options={})
        Lob.submit(:get, object_url, options)["data"] || []
      end

      def find(lob_object_id)
        Lob.submit :get, object_url(lob_object_id)
      end

      def create(options = {})
        Lob.submit :post, object_url, options
      end

      def destroy(lob_object_id)
        Lob.submit :delete, object_url(lob_object_id)
      end

      private

      def object_url(lob_object_id = nil)
        @resource.construct_url("objects", lob_object_id)
      end

    end
  end
end
