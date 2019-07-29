require "lob/resources/address"
require "lob/resources/bank_account"
require "lob/resources/check"
require "lob/resources/group"
require "lob/resources/intl_verifications"
require "lob/resources/letter"
require "lob/resources/member"
require "lob/resources/postcard"
require "lob/resources/us_autocompletions"
require "lob/resources/us_verifications"
require "lob/resources/us_zip_lookups"

module Lob
  class Client

    attr_reader :config

    def initialize(config = nil)
      if config.nil? || config[:api_key].nil?
        raise ArgumentError.new(":api_key is a required argument to initialize Lob")
      end

      @config = config
    end

    def addresses
      Lob::Resources::Address.new(config)
    end

    def bank_accounts
      Lob::Resources::BankAccount.new(config)
    end

    def checks
      Lob::Resources::Check.new(config)
    end
    
    def groups
      Lob::Resources::Group.new(config)
    end

    def intl_verifications
      Lob::Resources::IntlVerifications.new(config)
    end

    def letters
      Lob::Resources::Letter.new(config)
    end

    def members
      Lob::Resources::Member.new(config)
    end

    def postcards
      Lob::Resources::Postcard.new(config)
    end

    def us_autocompletions
      Lob::Resources::USAutocompletions.new(config)
    end

    def us_verifications
      Lob::Resources::USVerifications.new(config)
    end

    def us_zip_lookups
      Lob::Resources::USZipLookups.new(config)
    end

  end
end
