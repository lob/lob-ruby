module Lob
  module V1
    class Check

      def initialize(resource)
        @resource = resource
      end

      def list(options={})
        Lob.submit(:get, check_url, options)["data"] || []
      end

      def find(check_id)
        Lob.submit :get, check_url(check_id)
      end

      def create(options = {})
        if !options[:to].is_a?(String)
          options[:to] = @resource.format_address_params(options[:to])
        end

        Lob.submit :post, check_url, options
      end


      private

      def check_url(check_id = nil)
        @resource.construct_url("checks", check_id)
      end

    end
  end
end
