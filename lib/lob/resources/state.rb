require "lob/resources/resource_base"

module Lob
  module Resources
    class State < Lob::Resources::ResourceBase

      undef_method :find, :create, :destroy

      def initialize(config)
        super(config)
        @endpoint = "states"
      end

    end
  end
end
