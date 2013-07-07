module Lob
  module V1
    class Resource

      attr_accessor :options

      def initialize(options)
        @options = options
      end

      def addresses
        Lob::V1::Address.new(self)
      end

      def jobs
        Lob::V1::Job.new(self)
      end

      def objects
        Lob::V1::Object.new(self)
      end

      def packagings
        Lob::V1::Packaging.new(self)
      end

      def postcards
        Lob::V1::Postcard.new(self)
      end

      def services
        Lob::V1::Service.new(self)
      end

      def settings
        Lob::V1::Setting.new(self)
      end

      def base_url
        "#{@options[:protocol]}://#{@options[:api_key]}:@#{@options[:api_host]}/v1"
      end

      def construct_url(resource_type, resource_id=nil)
        "#{base_url}/#{resource_type}/#{resource_id}"
      end

    end
  end
end
