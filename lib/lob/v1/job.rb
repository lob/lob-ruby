require_relative "resource"

module Lob
  module V1
    class Job < Lob::V1::Resource

      undef_method :destroy

      def initialize(config)
        super(config)
        @endpoint = "jobs"
      end

      def create(options = {})
        if options[:objects].is_a?(Array)
          options[:objects].each_with_index do |object, index|
            options["object#{index+1}"] = object
          end
        else
          options["object1"] = options[:objects]
        end
        options.delete :objects

        submit :post, endpoint_url, options
      end

    end
  end
end
