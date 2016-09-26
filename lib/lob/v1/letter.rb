require_relative "resource"

module Lob
  module V1
    class Letter < Lob::V1::Resource

      def initialize(config)
        super(config)
        @endpoint = "letters"
      end

    end
  end
end
