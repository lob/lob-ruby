module Lob
  module V1
    class Job

      def initialize(resource)
        @resource = resource
      end

      def list(options={})
        Lob.submit(:get, job_url, options)
      end

      def find(job_id)
        Lob.submit :get, job_url(job_id)
      end

      def create(options = {})
        if options[:objects].is_a?(Array)
          options[:objects].each_with_index do |object, index|
            options["object#{index+1}"] = object
          end
        else
          options["object1"] = options[:objects]
        end
        options.delete(:objects)

        if options[:to] && !options[:to].is_a?(String)
          options[:to] = @resource.format_address_params(options[:to])
        end

        if options[:from] && !options[:from].is_a?(String)
          options[:from] = @resource.format_address_params(options[:from])
        end

        Lob.submit :post, job_url, options
      end


      private

      def job_url(job_id = nil)
        @resource.construct_url("jobs", job_id)
      end

    end
  end
end
