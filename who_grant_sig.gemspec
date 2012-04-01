# -*- encoding: utf-8 -*-
require File.expand_path('../lib/who_grant_sig/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Maxwell Salzberg"]
  gem.email         = ["maxwell@joindiaspora.com"]
  gem.description   = %q{a really simple request signature library}
  gem.summary       = %q{helps you do private CORS and other web authentication based on public keys}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "who_grant_sig"
  gem.require_paths = ["lib"]
  gem.version       = WhoGrantSig::VERSION


  gem.add_development_dependency 'rspec', '~> 2.9'
  gem.add_development_dependency 'rake'
end
