module Lob
  module V1
    class Address

      def initialize(resource)
        @resource = resource
      end

      def verify(options={})
        raise ArgumentError.new("atleast one of the options must be specified") if options.empty?
        Lob.submit(:get, address_verify_url, options)
      end

      def list(options={})
        Lob.submit(:get, address_url, options)["data"] || []
      end

      def find(address_id)
        Lob.submit :get, address_url(address_id)
      end

      def create(options = {})
        Lob.require_options(options, :name, :address, :city, :state, :zip, :country)

        if options[:address].is_a?(String)
          options[:address_line1] = options[:address]
        elsif options[:address].is_a?(Array)
          options[:address_line1] = options[:address][0]
          options[:address_line2] = options[:address][1]
        else
          raise ArgumentError.new("Address can only be an Array or String")
        end

        [:city, :state, :zip, :country].each do |option|
          options["address_#{option}".to_sym] = options[option]
          options.delete(option)
        end

        options.delete(:address)
        Lob.submit :post, address_url, options
      end

      def destroy(address_id)
        Lob.submit :delete, address_url(address_id)
      end

      private

      def address_url(address_id = nil)
        @resource.construct_url("addresses", address_id)
      end

      def address_verify_url
        @resource.construct_url("verify")
      end

    end
  end
end
