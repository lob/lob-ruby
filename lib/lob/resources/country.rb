require "lob/resources/resource_base"

module Lob
  module Resources
    class Country < Lob::Resources::ResourceBase

      undef_method :find, :create, :destroy

      def initialize(config)
        super(config)
        @endpoint = "countries"
      end

    end
  end
end
