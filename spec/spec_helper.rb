$:.unshift File.expand_path("../lib", File.dirname(__FILE__))

require "simplecov"
require "coveralls"

require 'simplecov-lcov'

SimpleCov::Formatter::LcovFormatter.config.report_with_single_file = true
SimpleCov::Formatter::LcovFormatter.config.lcov_file_name = 'lcov.info'

SimpleCov.formatter = SimpleCov::Formatter::LcovFormatter
SimpleCov.start

require "lob"
require "minitest/spec"
require "minitest/pride"
require "minitest/autorun"

API_KEY = ENV['API_KEY']
