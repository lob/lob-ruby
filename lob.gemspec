# coding: utf-8
$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require "lob/version"

Gem::Specification.new do |spec|
  spec.name          = "lob"
  spec.version       = Lob::VERSION
  spec.authors       = ["Lob"]
  spec.email         = ["support@lob.com"]
  spec.description   = %q{Lob API Ruby wrapper}
  spec.summary       = %q{Ruby wrapper for Lob.com API with ActiveRecord-style syntax}
  spec.homepage      = "https://github.com/lob/lob-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", "~> 1.8"

  spec.add_dependency "prawn"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.4.2"
  spec.add_development_dependency "minitest", "~> 5.6.1"
  spec.add_development_dependency "webmock", "~> 1.2"
  spec.add_development_dependency "travis-lint", "~> 2.0.0"
  spec.add_development_dependency "vcr", "~> 2.9.2"
  spec.add_development_dependency "coveralls", "~> 0.8.1"
  spec.add_development_dependency "simplecov", "~> 0.10.0"
  spec.add_development_dependency "pry", "~> 0.10.0"
end
