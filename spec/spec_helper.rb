ENV["SINATRA_ENV"] = "test"

require_relative '../config/environment'
require 'rack/test'
require 'capybara/rspec'
require 'capybara/dsl'
require 'factory_girl'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate SINATRA_ENV=test` to resolve the issue.'
end

ActiveRecord::Base.logger = nil

RSpec.configure do |config|
  config.include Rack::Test::Methods #=> responsible for get, post, etc
  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods

  FactoryGirl.definition_file_paths = %w{./factories ./test/factories ./spec/factories}
  FactoryGirl.find_definitions
  DatabaseCleaner.strategy = :truncation


  # This may be slow a rake task my be optimal
  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end

  config.order = 'default'
  # config.mock_with :rspec do |mocks|
  #   mocks.verify_partial_doubles = true
  # end

end

def app
  Rack::Builder.parse_file('config.ru').first
end

Capybara.app = app
