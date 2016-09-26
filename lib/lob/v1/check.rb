require_relative "resource"

module Lob
  module V1
    class Check < Lob::V1::Resource

      def initialize(config)
        super(config)
        @endpoint = "checks"
      end

    end
  end
end
