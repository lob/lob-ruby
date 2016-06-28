module Lob
  module V1
    class Letter

      def initialize(resource)
        @resource = resource
      end

      def list(options={})
        Lob.submit(:get, letter_url, options)
      end

      def find(letter_id)
        Lob.submit :get, letter_url(letter_id)
      end

      def create(options = {})
        Lob.submit :post, letter_url, options
      end

      def destroy(letter_id)
        Lob.submit :delete, letter_url(letter_id)
      end

      private

      def letter_url(job_id = nil)
        @resource.construct_url("letters", job_id)
      end

    end
  end
end
