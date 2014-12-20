require "rest-client"
require "json"
require "lob/version"
require "lob/errors/lob_error"
require "lob/errors/invalid_request_error"
require "lob/errors/version_invalid_error"

# Dynamically require files
Dir[File.join(File.dirname(__FILE__), 'lob', 'v*', '*.rb')].each {|file| require file }

module Lob
  class << self
    attr_accessor :api_key, :api_version, :protocol, :api_host

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
    clientVersion = Lob::VERSION
    begin
      if method == :get || method == :delete
        JSON.parse(RestClient.send(method, url, {
          user_agent: 'Lob/v1 RubyBindings/' + clientVersion,
          params: parameters,
          "Lob-Version" => self.api_version
        }))
      else
        JSON.parse(RestClient.send(method, url, parameters, {
          user_agent: 'Lob/v1 RubyBindings/' + clientVersion,
          "Lob-Version" => self.api_version
        }))
      end

    rescue RestClient::ExceptionWithResponse => e
      handle_api_error(e)
    end
  end

  def self.load(options={})
    Lob(options)
  end

  def self.handle_api_error(error)
    begin
      response = JSON.parse(error.http_body)
      error_obj = response["errors"].first
      message = error_obj["message"]
      raise InvalidRequestError.new(message, error.http_code, error.http_body, error.response)
    rescue JSON::ParserError
      raise LobError.new("Invalid response object: #{}", error.http_code, error.http_body)
    end
  end
end

def Lob(options={})
  options[:api_host]     ||= Lob.api_host    || "api.lob.com"
  options[:protocol]     ||= Lob.protocol    || "https"
  options[:api_version]  ||= Lob.api_version || "v1"
  options[:api_key]      ||= Lob.api_key

  if options[:api_key].nil?
    raise ArgumentError.new(":api_key is a required argument to initialize Lob")
  end

  if Dir[File.join(File.dirname(__FILE__), 'lob', options[:api_version])].empty?
    raise Lob::VersionInvalidError.new("api version #{options[:api_version]} doesn't exist")
  end

  Lob.const_get(options[:api_version].capitalize).const_get("Resource").new(options)
end
