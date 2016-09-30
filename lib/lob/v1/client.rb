require_relative "address"
require_relative "area"
require_relative "bank_account"
require_relative "check"
require_relative "country"
require_relative "letter"
require_relative "postcard"
require_relative "route"
require_relative "state"

module Lob
  module V1
    class Client

      attr_reader :config

      def initialize(config)
        @config = config
      end

      def options
        config
      end

      def areas
        Lob::V1::Area.new(config)
      end

      def addresses
        Lob::V1::Address.new(config)
      end

      def bank_accounts
        Lob::V1::BankAccount.new(config)
      end

      def checks
        Lob::V1::Check.new(config)
      end

      def countries
        Lob::V1::Country.new(config)
      end

      def letters
        Lob::V1::Letter.new(config)
      end

      def postcards
        Lob::V1::Postcard.new(config)
      end

      def routes
        Lob::V1::Route.new(config)
      end

      def states
        Lob::V1::State.new(config)
      end

    end
  end
end
