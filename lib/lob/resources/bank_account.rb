require "lob/resources/resource_base"

module Lob
  module Resources
    class BankAccount < Lob::Resources::ResourceBase

      def initialize(config)
        super(config)
        @endpoint = "bank_accounts"
      end

      def verify(bank_account_id, options = {})
        submit :post, verify_url(bank_account_id), options
      end

      private

      def verify_url(bank_account_id)
        "#{resource_url(bank_account_id)}/verify"
      end

    end
  end
end
