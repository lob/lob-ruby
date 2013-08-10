# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)


Gem::Specification.new do |spec|
  spec.name          = "lob"
  spec.version       = "1.0.3"
  spec.authors       = ["Akash Manohar J"]
  spec.email         = ["akash@akash.im"]
  spec.description   = %q{Lob API Ruby wrapper}
  spec.summary       = %q{Ruby wrapper for Lob.com API with ActiveRecord-style syntax}
  spec.homepage      = "https://github.com/lob/lob-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", ">= 0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "webmock", '~> 1.2'
  spec.add_development_dependency "vcr"
end
