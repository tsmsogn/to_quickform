# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "to_quickform/version"

Gem::Specification.new do |spec|
  spec.name          = "to_quickform"
  spec.version       = ToQuickform::VERSION
  spec.authors       = ["tsmsogn"]
  spec.email         = ["tsmsogn@gmail.com"]

  spec.summary       = %q{ToQuickform creates some QuickForm codes from given data.}
  spec.description   = %q{ToQuickform creates some QuickForm codes from given data.}
  spec.homepage      = "https://github.com/tsmsogn/to_quickform"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
