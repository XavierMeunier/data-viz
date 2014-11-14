# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'data_viz/version'

Gem::Specification.new do |spec|
  spec.name          = "data_viz"
  spec.version       = DataViz::VERSION
  spec.authors       = ["gpattus", "XavierMeunier"]
  spec.email         = ["pattusg@gmail.com", "m.xaviermeunier@gmail.com"]
  spec.summary       = "DataViz is a gem which allow you to visualize your models on a graphic way"
  spec.description   = "DataViz is a gem which allow you to visualize your models on a graphic way with multiple parameters. You can save the way you want it to be displayed and choose among multiple options to display only parts of it. It also writes an historic of your models through time."
  spec.homepage      = ""
  spec.license       = "GPL-2.0"

  spec.rubyforge_project = "data_viz"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end