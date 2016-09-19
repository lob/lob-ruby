require_relative "resource"

module Lob
  module V1
    class Route < Lob::V1::Resource

      undef_method :create, :destroy

      def initialize(config)
        super(config)
        @endpoint = "routes"
      end

      def list(options = {})
        if options.is_a?(String)
          submit :get, resource_url(options)
        else
          submit :get, endpoint_url, options
        end
      end

    end
  end
end
