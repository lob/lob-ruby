$:.unshift File.expand_path("../lib", File.dirname(__FILE__))

require "lob"
require "minitest/spec"
require "minitest/pride"
require "minitest/autorun"
require "vcr"
require "coveralls"

Coveralls.wear!

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :webmock
end
