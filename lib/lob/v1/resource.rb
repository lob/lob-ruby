module Lob
  module V1
    class Resource

      attr_accessor :options

      def initialize(options)
        @options = options
      end

      def areas
        Lob::V1::Area.new(self)
      end

      def addresses
        Lob::V1::Address.new(self)
      end

      def bank_accounts
        Lob::V1::BankAccount.new(self)
      end

      def checks
        Lob::V1::Check.new(self)
      end

      def countries
        Lob::V1::Country.new(self)
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

      def routes
        Lob::V1::Route.new(self)
      end

      def services
        Lob::V1::Service.new(self)
      end

      def settings
        Lob::V1::Setting.new(self)
      end

      def states
        Lob::V1::State.new(self)
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

        new_params = params.clone

        [:city, :state, :zip, :country].each do |option|
          new_params["address_#{option}".to_sym] = params[option] if params[option]
          new_params.delete(option)
        end

        new_params
      end

    end
  end
end
