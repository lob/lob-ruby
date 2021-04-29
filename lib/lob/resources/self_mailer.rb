require "lob/resources/resource_base"

module Lob
  module Resources
    class SelfMailer < Lob::Resources::ResourceBase

      def initialize(config)
        super(config)
        @endpoint = "self_mailers"
      end

    end
  end
end
