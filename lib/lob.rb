require "rest-client"
require "json"
require "lob/lob_error"

# Dynamically require files
Dir[File.join(File.dirname(__FILE__), 'lob', 'v*', '*.rb')].each {|file| require file }

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
    clientVersion = Gem.latest_spec_for('lob').version.to_s

    if method == :get || method == :delete
      JSON(RestClient.send(method, url, {
        user_agent: 'Lob/v1 NodeBindings/' + clientVersion,
        params: parameters
      }))
    else
      JSON(RestClient.send(method, url, parameters, {
        user_agent: 'Lob/v1 NodeBindings/' + clientVersion
      }))
    end
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

  def self.load(options={})
    Lob(options)
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
