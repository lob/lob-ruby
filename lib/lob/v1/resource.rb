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
        "#{base_url}/#{resource_type}#{'/' + resource_id if resource_id}"
      end

      #NOTE to format address param names into API-compatible ones
      def format_address_params(params, check_required_options=true)
        if check_required_options
          Lob.require_options(params, :name, :address_line1, :city, :state, :zip, :country)
        end

        [:city, :state, :zip, :country].each do |option|
          params["address_#{option}".to_sym] = params[option] if params[option]
          params.delete(option)
        end

        params
      end

    end
  end
end
