lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fixy/version'

Gem::Specification.new do |spec|
  spec.name          = 'fixy'
  spec.version       = Fixy::VERSION
  spec.authors       = ['Omar Skalli']
  spec.email         = ['omar@zenpayroll.com']
  spec.description   = 'Library for generating fixed width flat files.'
  spec.summary       = 'Provides a DSL for defining, generating, and debugging fixed width documents.'
  spec.homepage      = 'https://github.com/chetane/fixy'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry-byebug'

  spec.add_runtime_dependency 'rake', '>= 10.4.2'
  spec.add_runtime_dependency 'i18n'
end
