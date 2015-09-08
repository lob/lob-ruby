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

      def letters
        Lob::V1::Letter.new(self)
      end

      def objects
        Lob::V1::Object.new(self)
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

    end
  end
end
