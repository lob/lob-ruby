require "lob/resources/resource_base"

module Lob
  module Resources
    class USAutocompletions < Lob::Resources::ResourceBase

      undef_method :list, :find, :create, :destroy

      def initialize(config)
        super(config)
        @endpoint = "us_autocompletions"
      end

      def autocomplete(body={})
        request = {
          method: :post,
          url: endpoint_url,
          body: body
        }

        submit request
      end

    end
  end
end
