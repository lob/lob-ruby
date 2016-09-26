require_relative "resource"

module Lob
  module V1
    class Object < Lob::V1::Resource

      def initialize(config)
        super(config)
        @endpoint = "objects"
      end

    end
  end
end
