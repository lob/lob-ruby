require "rest-client"
require "json"

require "lob/lob_error"
require "lob/v1/resource"
require "lob/v1/address"
require "lob/v1/job"
require "lob/v1/object"
require "lob/v1/packaging"
require "lob/v1/postcard"
require "lob/v1/route"
require "lob/v1/service"
require "lob/v1/setting"
require "lob/v1/country"
require "lob/v1/check"
require "lob/v1/bank_account"
require "lob/v1/area"

module Lob

  class << self
    attr_accessor :api_key,
                  :api_version,
                  :protocol,
                  :api_host

    def configure
      yield self
      true
    end

    alias :config :configure
  end


  def self.require_options(options, *keys)
    keys.each do |key|
      raise ArgumentError.new(":#{key} is required") unless options.key?(key)
    end
  end


  def self.submit(method, url, parameters={})
    parameters = {:params => parameters} if method == :get
    JSON(RestClient.send(method, url, parameters))
  # :nocov:
  rescue => e
    begin
      # Parse the error to raise a nice Lob::Error
      json = JSON(e.http_body)

      if json.has_key? 'errors'
        error_message = json["errors"].first.values.first
      elsif json.has_key? 'message'
        error_message = json["message"]
      else
        error_message = "Unknown error: #{json}"
      end

      raise Lob::Error.new(error_message)
    rescue
      # If error parsing failed re-raise the original error
      raise e
    end
  # :nocov:
  end

end


def Lob(options={})
  options[:api_host]     ||= Lob.api_host    || "api.lob.com"
  options[:protocol]     ||= Lob.protocol    || "https"
  options[:api_version]  ||= Lob.api_version || "v1"
  options[:api_key]      ||= Lob.api_key

  unless options[:api_key]
    raise ArgumentError.new(":api_key is a required argument to initialize Lob")
  end

  #TODO check if the version exists first
  Lob.const_get("#{options[:api_version].capitalize}").const_get("Resource").new(options)
end
