module Lob
  module V1
    class BankAccount

      def initialize(resource)
        @resource = resource
      end

      def list(options={})
        Lob.submit(:get, bank_account_url, options)
      end

      def find(bank_account_id)
        Lob.submit :get, bank_account_url(bank_account_id)
      end

      def create(options = {})
        Lob.submit :post, bank_account_url, options
      end

      def destroy(bank_account_id)
        Lob.submit :delete, bank_account_url(bank_account_id)
      end

      def verify(bank_account_id, options = {})
        Lob.submit :post, "#{bank_account_url(bank_account_id)}/verify", options
      end

      private

      def bank_account_url(bank_account_id = nil)
        @resource.construct_url("bank_accounts", bank_account_id)
      end

    end
  end
end
