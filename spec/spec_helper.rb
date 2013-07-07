$:.unshift File.expand_path("../lib", File.dirname(__FILE__))

require "lob"
require "minitest/spec"
require "minitest/pride"
require "minitest/autorun"
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :webmock
end

VCR.use_cassette("example") do
  RestClient.get 'https://raw.github.com/gist/3887508/b84579e450e2fb483b9b0475d938b7acd8861d15/README.md'
end