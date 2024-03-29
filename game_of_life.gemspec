lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'game_of_life/version'

Gem::Specification.new do |spec|
  spec.name          = 'game_of_life_om'
  spec.version       = GameOfLife::VERSION
  spec.authors       = ['Mojicator']
  spec.email         = ['oscar2mojica@gmail.com']

  spec.summary       = 'It is a cellular automaton devised by the British
                        mathematician John Horton Conway in 1970.'
  spec.description   = "Conway's game of life"
  spec.homepage      = 'https://rubygems.org/gems/game_of_life_om'
  spec.license       = 'MIT'

  # spec.metadata['allowed_push_host'] = ''

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Mojicator/Conway-s-game-of-life'
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
  #   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # end
  spec.files         = Dir['lib/**/*.rb']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
end
