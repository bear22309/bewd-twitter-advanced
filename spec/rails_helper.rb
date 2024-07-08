# spec/rails_helper.rb

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'rails-controller-testing' # Add this line

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories.
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # Disable transactional fixtures to use DatabaseCleaner
  config.use_transactional_fixtures = false

  # DatabaseCleaner configuration to handle potential database locks
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  # Include FactoryBot syntax to simplify calls to factories
  config.include FactoryBot::Syntax::Methods

  # Include FixtureFileUpload to support testing file uploads
  config.include ActionDispatch::TestProcess::FixtureFileUpload

  # Include Rails Controller Testing helpers
  config.include Rails::Controller::Testing::TestProcess
  config.include Rails::Controller::Testing::TemplateAssertions
  config.include Rails::Controller::Testing::Integration

  # Include URL helpers to simplify generating URLs in tests
  config.include Rails.application.routes.url_helpers

  # If using Devise or other authentication methods, include test helpers here
  # config.include Devise::Test::ControllerHelpers, type: :controller
end

