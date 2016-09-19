require_relative "resource"

module Lob
  module V1
    class Setting < Lob::V1::Resource

      undef_method :create, :destroy

      def initialize(config)
        super(config)
        @endpoint = "settings"
      end

    end
  end
end
