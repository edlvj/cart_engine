$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cart_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cart_engine"
  s.version     = CartEngine::VERSION
  s.authors     = ["Ed Gorach"]
  s.email       = ["gorachedik96@gmail.com"]
  s.homepage    = "https://github.com/edlvj/cart_engine"
  s.summary     = "CartEngine for BookStore."
  s.description = "CartEngine for BookStore."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]
  
  s.add_dependency 'rails', "~> 5.0.1"
  s.add_dependency 'coffee-rails', '~> 4.2'
  s.add_dependency 'turbolinks', '~> 5'
  s.add_dependency 'drape'
  s.add_dependency 'aasm'
  s.add_dependency 'wicked'
  s.add_dependency 'rectify'
  s.add_dependency 'cancancan'
  s.add_dependency 'rails-i18n'
  s.add_dependency 'haml'
  s.add_dependency 'simple_form'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'jquery-rails'
 
  s.add_development_dependency 'pg'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'wisper-rspec'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'with_model'
  s.add_development_dependency 'shoulda-matchers'
end
