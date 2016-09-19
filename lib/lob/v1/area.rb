require_relative "resource"

module Lob
  module V1
    class Area < Lob::V1::Resource

      undef_method :destroy

      def initialize(config)
        super(config)
        @endpoint = "areas"
      end

    end
  end
end
