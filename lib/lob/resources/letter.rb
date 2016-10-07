require "lob/resources/resource_base"

module Lob
  module Resources
    class Letter < Lob::Resources::ResourceBase

      def initialize(config)
        super(config)
        @endpoint = "letters"
      end

    end
  end
end
