module Lob
  module V1
    class Route
      def initialize(resource)
        @resource = resource
      end

      def find(route)
        Lob.submit :get, route_url(route)
      end

      def list(options = {})
        if options.is_a?(String)
          Lob.submit(:get, route_url(options))
        else
          Lob.submit(:get, route_url, options)
        end
      end

      private

      def route_url(route_id = nil)
        @resource.construct_url("routes", route_id)
      end
    end
  end
end
