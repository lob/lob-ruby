module Lob
  module V1
    class Postcard

      def initialize(resource)
        @resource = resource
      end

      def list(options={})
        Lob.submit(:get, postcard_url, options)["data"] || []
      end

      def find(postcard_id)
        Lob.submit :get, postcard_url(postcard_id)
      end

      def create(name, to, options = {})
        options = { name: name, to: to }.merge(options)
        if options[:to] && !options[:to].is_a?(String)
          options[:to] = @resource.format_address_params(options[:to])
        end

        if options[:from] && !options[:from].is_a?(String)
          options[:from] = @resource.format_address_params(options[:from])
        end

        Lob.submit :post, postcard_url, options
      end


      private

      def postcard_url(postcard_id = nil)
        @resource.construct_url("postcards", postcard_id)
      end

    end
  end
end
