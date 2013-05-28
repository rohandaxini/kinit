# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kinit/version'

Gem::Specification.new do |spec|
  spec.name          = "kinit"
  spec.version       = Kinit::VERSION
  spec.authors       = ["Rohan Daxini at Kiprosh.com"]
  spec.email         = ["rohan_daxini@yahoo.com"]
  spec.description   = %q{This gem is used to enforce gems and best practices in the project eg. whether cane, rails_best_practices gems are included or not etc. and other stuff. You may also configure what all you would like to enforce.}
  spec.summary       = %q{This gem is used to enforce gems and best practices in the project eg. whether cane, rails_best_practices gems are included or not etc.}
  spec.homepage      = "https://github.com/rohandaxini/kinit"
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*.rb'] + Dir['bin/*'] + Dir['ext/**/*.so'] + Dir['ext/**/*.dll']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.platform      = Gem::Platform::RUBY
  spec.require_paths = ['lib', 'ext']
  spec.extensions    = Dir['ext/**/extconf.rb']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

end
