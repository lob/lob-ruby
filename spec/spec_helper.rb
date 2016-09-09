$:.unshift File.expand_path("../lib", File.dirname(__FILE__))

require "simplecov"
require "coveralls"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start

require "lob"
require "minitest/spec"
require "minitest/pride"
require "minitest/autorun"

API_KEY = 'test_799ff27291c166d10ba191902ad02fb059c'
