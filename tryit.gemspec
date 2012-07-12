# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tryit/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sergey Gopkalo","Michael Kohl ?"]
  gem.email         = ["Sergey.Gopkalo@gmail.com"]
  gem.description   = %q{try methods without exceptions}
  gem.summary       = %q{Using tryit allows to make more compact code the try method from Rails}
  gem.homepage      = "http://github.com/sevenmaxis/tryit"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "tryit"
  gem.require_paths = ["lib"]
  gem.version       = Tryit::VERSION

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec", "~>2.9.0"
end
