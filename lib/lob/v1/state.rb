module Lob
  module V1
    class State

      def initialize(resource)
        @resource = resource
      end

      def list(options={})
        Lob.submit(:get, state_url, options)
      end

      private

      def state_url
        @resource.construct_url("states")
      end

    end
  end
end
