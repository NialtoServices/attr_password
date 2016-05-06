# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'attr_password/constants'

Gem::Specification.new do |spec|
  spec.name          = 'attr_password'
  spec.version       = AttrPassword::VERSION
  spec.authors       = ['Rediweb Hosting']
  spec.email         = ['support@rediwebhosting.uk']

  spec.summary       = %q{Password Attribute}
  spec.description   = %q{Store passwords securely.}
  spec.homepage      = 'https://rubygems.org/gems/attr_password'
  spec.license       = 'GPL-3.0'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.executables   = spec.files.grep(%r{^bin/(?!((console|setup)$))}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord', '~> 4.2'
  spec.add_dependency 'bcrypt',       '~> 3.1'
  spec.add_dependency 'unix-crypt',   '~> 1.3'

  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'rspec',   '~> 3.0'
  spec.add_development_dependency 'bundler', '~> 1.11'
end
