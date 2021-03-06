
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "meetup_cli/version"

Gem::Specification.new do |spec|
  spec.name          = "meetup_cli"
  spec.version       = MeetupCli::VERSION
  spec.authors       = ["'tahseen447 Siddiqui'"]
  spec.email         = ["'tahseenfatima1986@gmail.com'"]

  spec.summary       = %q{Meet up Cli app helps users find latest upcoming meetups in the Neighborhood based on their interests.}
  spec.description   = %q{Enter the category and select activities based on interests, the app gives out upcoming meetups around the neighborhood }
  spec.homepage      = "https://www.github.com/tahseen447"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = 'https://rubygems.org/'
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'pry', '~> 0.9.12.2'
  spec.add_dependency 'nokogiri','~>1.6'
  spec.add_development_dependency 'poltergeist'
end
