module Lob
  module V1
    class Setting

      def initialize(resource)
        @resource = resource
      end

      def list(options={})
        Lob.submit(:get, setting_url, options)["data"] || []
      end

      def find(setting_id)
        Lob.submit :get, setting_url(setting_id)
      end

      private

      def setting_url(setting_id = nil)
        @resource.construct_url("settings", setting_id)
      end

    end
  end
end
