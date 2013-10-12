module Lob
  module V1
    class Country

      def initialize(resource)
        @resource = resource
      end

      def list(options={})
        Lob.submit(:get, country_url, options)["data"] || []
      end

      private

      def country_url
        @resource.construct_url("countries")
      end

    end
  end
end
