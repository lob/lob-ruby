require "lob/resources/resource_base"

module Lob
  module Resources
    class Check < Lob::Resources::ResourceBase

      def initialize(config)
        super(config)
        @endpoint = "checks"
      end

    end
  end
end
