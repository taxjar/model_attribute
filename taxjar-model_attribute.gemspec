# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'model_attribute/version'

Gem::Specification.new do |spec|
  spec.name          = "taxjar-model_attribute"
  spec.version       = ModelAttribute::VERSION
  spec.authors       = ["Jake Johnson"]
  spec.email         = ["jake@taxjar.com"]
  spec.summary       = %q{Attributes for non-ActiveRecord models}
  spec.description   = <<-EOF
    Attributes for non-ActiveRecord models.
    Smaller and simpler than Virtus, and adds dirty tracking.
    Extends David Waller's original gem model_attribute with more types.
  EOF
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler",         "~> 1.7"
  spec.add_development_dependency "rake",            "~> 10.0"
  spec.add_development_dependency "rspec",           "~> 3.1"
  spec.add_development_dependency "rspec-nc",        "~> 0.2"
  spec.add_development_dependency "guard",           "~> 2.8"
  spec.add_development_dependency "guard-rspec",     "~> 4.3"
end
