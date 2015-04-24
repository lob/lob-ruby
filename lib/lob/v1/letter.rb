module Lob
  module V1
    class Letter

      def initialize(resource)
        @resource = resource
      end

      def list(options={})
        Lob.submit(:get, letter_url, options)["data"] || []
      end

      def find(job_id)
        Lob.submit :get, letter_url(job_id)
      end

      def create(options = {})

        if options[:to] && !options[:to].is_a?(String)
          options[:to] = @resource.format_address_params(options[:to])
        end

        if options[:from] && !options[:from].is_a?(String)
          options[:from] = @resource.format_address_params(options[:from])
        end

        Lob.submit :post, letter_url, options
      end


      private

      def letter_url(job_id = nil)
        @resource.construct_url("letters", job_id)
      end

    end
  end
end
