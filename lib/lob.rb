require "lob/v1/client"
require "lob/version"
require "lob/errors/lob_error"
require "lob/errors/invalid_request_error"

module Lob

  class << self
    attr_accessor :api_key, :api_version, :protocol, :api_host

    def configure
      yield self
      true
    end
    alias :config :configure
  end

  def self.load(options={})
    Lob(options)
  end

end

def Lob(options={})
  options[:api_host]     ||= Lob.api_host    || "api.lob.com"
  options[:protocol]     ||= Lob.protocol    || "https"
  options[:api_version]  ||= Lob.api_version
  options[:api_key]      ||= Lob.api_key

  if options[:api_key].nil?
    raise ArgumentError.new(":api_key is a required argument to initialize Lob")
  end

  Lob::V1::Client.new(options)

end
