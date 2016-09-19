require_relative "resource"

module Lob
  module V1
    class Postcard < Lob::V1::Resource

      def initialize(config)
        super(config)
        @endpoint = "postcards"
      end

    end
  end
end
