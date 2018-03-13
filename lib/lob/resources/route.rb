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
          request = {
            method: :get,
            url: resource_url(options)
          }
        else
          request = {
            method: :get,
            url: endpoint_url,
            query: options
          }
        end

        submit request
      end

    end
  end
end
