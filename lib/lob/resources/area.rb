require "lob/resources/resource_base"

module Lob
  module Resources
    class Area < Lob::Resources::ResourceBase

      undef_method :destroy

      def initialize(config)
        super(config)
        @endpoint = "areas"
      end

    end
  end
end
