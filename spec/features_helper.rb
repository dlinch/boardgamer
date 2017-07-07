require 'rails_helper'
require 'capybara/rspec'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :selenium
Capybara.server_host = 'localhost'
Capybara.server_port = 31337

RSpec.configure do |config|
  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start

    Capybara.page.driver.reset!
    Capybara.reset_sessions!
  end

  config.after(:each) do
    Capybara.page.driver.reset!
    Capybara.reset_sessions!

    DatabaseCleaner.clean
  end
end
