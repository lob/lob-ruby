require "lob/resources/resource_base"

module Lob
  module Resources
    class Address < Lob::Resources::ResourceBase

      def initialize(config)
        super(config)
        @endpoint = "addresses"
      end

    end
  end
end
