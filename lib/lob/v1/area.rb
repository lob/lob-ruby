module Lob
  module V1
    class Area
      def initialize(resource)
        @resource = resource
      end

      def list(options = {})
        Lob.submit(:get, area_url, options)["data"] || []
      end

      def find(lob_object_id)
        Lob.submit :get, area_url(lob_object_id)
      end

      def create(options = {})
        Lob.submit :post, area_url, options
      end

      private

      def area_url(area_id = nil)
        @resource.construct_url("areas", area_id)
      end
    end
  end
end
