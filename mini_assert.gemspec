# frozen_string_literal: true

require_relative 'lib/mini_assert/version'

Gem::Specification.new do |spec|
  spec.name          = 'mini_assert'
  spec.version       = MiniAssert::VERSION
  spec.authors       = ['Luis Adrián Chávez Fregoso']
  spec.email         = ['biolacf@gmail.com']

  spec.summary       = 'Assertion Gem only for me'
  spec.description   = 'Super fast gem for testing stuff'
  spec.homepage      = 'https://github.com/lacf95/mini_assert'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'pry', '~> 0.13'
  spec.add_development_dependency 'rake', '~> 13.0'
end
