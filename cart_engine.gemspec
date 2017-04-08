$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cart_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cart_engine"
  s.version     = CartEngine::VERSION
  s.authors     = ["Ed Gorach"]
  s.email       = ["gorachedik96@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of CartEngine."
  s.description = "TODO: Description of CartEngine."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.1"

  s.add_development_dependency "sqlite3"
end
