module Lob
  module V1
    class Packaging

      def initialize(resource)
        @resource = resource
      end

      def list(options={})
        Lob.submit(:get, packaging_url, options)["data"] || []
      end

      private

      def packaging_url
        @resource.construct_url("packagings")
      end

    end
  end
end
