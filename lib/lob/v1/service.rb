module Lob
  module V1
    class Service

      def initialize(resource)
        @resource = resource
      end

      def list(options={})
        Lob.submit(:get, service_url, options)["data"] || []
      end

      private

      def service_url
        @resource.construct_url("services")
      end

    end
  end
end
