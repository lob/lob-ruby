require "lob/resources/resource_base"

module Lob
  module Resources
    class Route < Lob::Resources::ResourceBase

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
