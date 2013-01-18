# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'putio-api/version'

Gem::Specification.new do |gem|
  gem.name          = "putio-api"
  gem.version       = PutioApi::VERSION
  gem.authors       = ["Sebastian Geiger"]
  gem.email         = ["sebastian.geiger@gmail.com"]
  gem.summary       = %q{Library/CLI to interact with put.io}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency('gli')
end
