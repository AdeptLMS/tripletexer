$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'tripletexer/version'

Gem::Specification.new do |s|
  s.name        = 'tripletexer'
  s.version     = Tripletexer::VERSION
  s.authors     = ['Aldis Berjoza']
  s.email       = ['aldis@berjoza.lv']
  s.homepage    = 'https://github.com/graudeejs/tripletexer'
  s.summary     = 'tripletex.no APIv2 client'
  s.license     = 'BSD-2-Clause'

  s.files = Dir['README.md', 'LICENSE', 'lib/**/*']
  s.test_files = Dir['spec/**/*']

  s.required_ruby_version = '>= 3.0'

  s.add_dependency 'faraday', '~> 2.9'
  s.add_dependency 'json', '>= 2.7.0'

  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'reek'
  s.add_development_dependency 'rubycritic'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'dotenv'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'rspec_junit_formatter'
  s.add_development_dependency 'coveralls'
end
