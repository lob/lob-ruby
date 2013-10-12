module Lob
  module V1
    class Check

      def initialize(resource)
        @resource = resource
      end

      def list(options={})
        Lob.submit(:get, check_url, options)["data"] || []
      end

      def find(check_id)
        Lob.submit :get, check_url(check_id)
      end

      def create(bank_account, to, amount, options = {})
        params = { bank_account: bank_account, to: to, amount: amount }.merge(options)

        if !params[:to].is_a?(String)
          params[:to] = @resource.format_address_params(params[:to])
        end

        Lob.submit :post, check_url, params
      end


      private

      def check_url(check_id = nil)
        @resource.construct_url("checks", check_id)
      end

    end
  end
end
