module Lob
  module V1
    class Route
      def initialize(resource)
        @resource = resource
      end

      def list(options = {})
        Lob.submit(:get, route_url, options)["data"] || []
      end

      private

      def route_url(route_id = nil)
        @resource.construct_url("routes", route_id)
      end
    end
  end
end
