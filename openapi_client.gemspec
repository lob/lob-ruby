# -*- encoding: utf-8 -*-
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

  s.add_runtime_dependency 'typhoeus', '~> 1.0', '>= 1.0.1'

  s.add_development_dependency 'rspec', '~> 3.6', '>= 3.6.0'

  s.files         = `find *`.split("\n").uniq.sort.select { |f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end
