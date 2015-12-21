# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cbr/version'

Gem::Specification.new do |spec|
  spec.name          = 'cbr'
  spec.version       = Cbr::VERSION
  spec.authors       = ['Artem Adamtsov']
  spec.email         = ['aay1990@gmail.com']

  spec.summary       = 'Ruby gem for get exchange rates from cbr.ru.'
  spec.description   = 'Ruby gem for get exchange rates from cbr.ru. Examle: Cbr::ExchangeRate.new.usd.rate'
  spec.homepage      = 'https://github.com/4itosik/cbr'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rspec', '~> 3.1.0'
  spec.add_development_dependency 'httparty'
  spec.add_development_dependency 'webmock'
end
