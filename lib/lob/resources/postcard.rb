require "lob/resources/resource_base"

module Lob
  module Resources
    class Postcard < Lob::Resources::ResourceBase

      def initialize(config)
        super(config)
        @endpoint = "postcards"
      end

    end
  end
end
