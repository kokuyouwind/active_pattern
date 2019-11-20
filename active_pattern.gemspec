require_relative 'lib/active_pattern/version'

Gem::Specification.new do |spec|
  spec.name          = "active_pattern"
  spec.version       = ActivePattern::VERSION
  spec.authors       = ["kokuyouwind"]
  spec.email         = ["kokuyouwind@gmail.com"]

  spec.summary       = %q{F# like ActivePattern in ruby pattern matching}
  spec.description   = %q{F# like ActivePattern in ruby pattern matching}
  spec.homepage      = "https://github.com/kokuyouwind/active_pattern"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
