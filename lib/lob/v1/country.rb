require_relative "resource"

module Lob
  module V1
    class Country < Lob::V1::Resource

      undef_method :find, :create, :destroy

      def initialize(config)
        super(config)
        @endpoint = "countries"
      end

    end
  end
end
