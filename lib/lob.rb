require "rest-client"
require "json"
require 'uri'
require "lob/version"
require "lob/errors/lob_error"
require "lob/errors/invalid_request_error"

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

  def self.submit(method, url, parameters={})
    clientVersion = Lob::VERSION

    begin
      if method == :get || method == :delete
        # Hack to URL encode nested objects like metadata.
        url = "#{url}?#{build_nested_query(parameters)}"
        JSON.parse(RestClient.send(method, url, {
          user_agent: 'Lob/v1 RubyBindings/' + clientVersion,
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
      message = response.fetch("error").fetch("message")
      raise InvalidRequestError.new(message, error.http_code, error.http_body, error.response)
    rescue JSON::ParserError, KeyError
      raise LobError.new("Invalid response object: #{}", error.http_code, error.http_body)
    end
  end

  def self.build_nested_query(value, prefix = nil)
    case value
    when Array
      value.map { |v|
        build_nested_query(v, "#{prefix}[]")
      }.join("&")
    when Hash
      value.map { |k, v|
        build_nested_query(v, prefix ? "#{prefix}[#{URI.encode_www_form_component(k)}]" : URI.encode_www_form_component(k))
      }.reject(&:empty?).join('&')
    when nil
      prefix
    else
      raise ArgumentError, "value must be a Hash" if prefix.nil?
      "#{prefix}=#{URI.encode_www_form_component(value)}"
    end
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

  Lob::V1::Resource.new(options)
end
