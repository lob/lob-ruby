require "lob/resources/resource_base"

module Lob
  module Resources
    class Group < Lob::Resources::ResourceBase

      def initialize(config)
        super(config)
        @endpoint = "groups"
      end

    end
  end
end
