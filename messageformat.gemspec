# frozen_string_literal: true

require_relative "lib/messageformat/version"

Gem::Specification.new do |spec|
  spec.name = "messageformat-wrapper"
  spec.version = MessageFormat::VERSION
  spec.authors = ["Loïc Guitaut"]
  spec.email = ["team@discourse.org"]

  spec.summary =
    "A wrapper around the @messageformat/core npm package to compile MessageFormat messages in Ruby"
  spec.description = spec.summary
  spec.homepage = "https://github.com/discourse/messageformat"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files =
    Dir.chdir(__dir__) do
      `git ls-files -z`.split("\x0")
        .reject do |f|
          (f == __FILE__) ||
            f.match(
              %r{\A(?:(?:bin|test|spec|features|messageformat-miniracer)/|\.(?:git|circleci)|appveyor)},
            )
        end
        .append(*Dir.glob("dist/*.js"))
    end
  spec.require_paths = ["lib"]

  spec.add_dependency "mini_racer", ">= 0.6.3"

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rubocop-discourse"
  spec.add_development_dependency "syntax_tree"
end
