# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kinit/version'

Gem::Specification.new do |spec|
  spec.name          = "kinit"
  spec.version       = Kinit::VERSION
  spec.authors       = ["Rohan Daxini at Kiprosh.com"]
  spec.email         = ["rohan@kiprosh.com"]
  spec.description   = %q{Kinit will make your Rails application better by
                          adhering to good practices.}
  spec.summary       = %q{A Gem enforcer tool to check and enforce important
                          gems and best practices for code quality in a Rails
                          application. Its configurable to enable disable what
                          all you want to enforce.}
  spec.homepage      = "https://github.com/rohandaxini/kinit"
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*.rb'] + Dir['bin/*'] + Dir['ext/**/*.so'] + Dir['ext/**/*.dll'] +
                        Dir['lib/tasks/*.rake'] + ['kinit_config.yml']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.platform      = Gem::Platform::RUBY
  spec.require_paths = ['lib', 'ext']
  spec.extensions    = Dir['ext/**/extconf.rb']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
