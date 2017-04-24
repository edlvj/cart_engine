ENV['RAILS_ENV'] ||= 'test'

if Rails.env.production?
  abort('The Rails environment is running in production mode!')
end

require 'spec_helper'
require 'rspec/rails'
require 'rectify/rspec'
require 'with_model'
require 'aasm/rspec'
require 'capybara/rspec'


ENGINE_ROOT = File.join(File.dirname(__FILE__), '../')
%w(support).each do |folder|
  Dir[File.join(ENGINE_ROOT, "spec/#{folder}/**/*.rb")].each do |file|
    require file
  end
end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Shoulda::Matchers::ActiveModel
  config.include Shoulda::Matchers::ActiveRecord
  config.include FactoryGirl::Syntax::Methods
  config.include Rectify::RSpec::Helpers
  config.include I18n
  config.extend WithModel
  config.include CartEngine::Engine.routes.url_helpers, type: :feature
  
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  Capybara.register_driver :selenium_chrome do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end

  Capybara.javascript_driver = :poltergeist
 
  FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
  FactoryGirl.find_definitions

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end