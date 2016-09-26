require_relative "resource"

module Lob
  module V1
    class State < Lob::V1::Resource

      undef_method :find, :create, :destroy

      def initialize(config)
        super(config)
        @endpoint = "states"
      end

    end
  end
end
