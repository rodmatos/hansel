$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "hansel/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "hansel"
  spec.version     = Hansel::VERSION
  spec.authors     = ["Rodolfo Matos"]
  spec.email       = ["rod@rodmatos.xyz"]
  spec.homepage    = "http://rodmatos.xyz"
  spec.summary     = "Audit gem for Ruby on Rails projects"
  spec.description = ""
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.0"

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "pg", "~> 1.0"
  spec.add_development_dependency "faker"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-rspec"
end
