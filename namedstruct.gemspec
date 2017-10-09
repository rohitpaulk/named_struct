# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "namedstruct"
  spec.version       = "0.2.2"
  spec.authors       = ["Paul Kuruvilla"]
  spec.email         = ["rohitpaulk@gmail.com"]

  spec.summary       = "A replacement for Struct that supports keyword arguments"
  spec.description   = "NamedStruct is a drop-in replacement for Ruby's " +
                       "built-in Struct, that supports initialization via " +
                       "keyword arguments rather than positional arguments."
  spec.homepage      = "https://github.com/rohitpaulk/named_struct"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
