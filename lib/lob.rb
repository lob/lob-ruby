require "rest-client"
require "json"

require "lob/lob_error"
require "lob/v1/resource"
require "lob/v1/address"
require "lob/v1/job"
require "lob/v1/object"
require "lob/v1/packaging"
require "lob/v1/postcard"
require "lob/v1/service"
require "lob/v1/setting"


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
  rescue => e
    error_message = nil
    raise e unless e.respond_to? :http_body
    begin
      error_message = JSON(e.http_body)["errors"].first.values.first
    rescue
      raise e
    end
    raise Lob::Error.new(error_message)
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
  Lob.const_get("#{options[:api_version].capitalize}::Resource").new(options)
end
