require_relative "resource"

module Lob
  module V1
    class BankAccount < Lob::V1::Resource

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
