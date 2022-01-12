require "lob/resources/resource_base"

module Lob
  module Resources
    class Card < Lob::Resources::ResourceBase

      def initialize(config)
        super(config)
        @endpoint = "cards"
      end

    end
  end
end
