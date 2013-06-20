ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
# require "minitest/autorun"
require "minitest/spec"
require "capybara/rails"
# To add Growl-notify
#require "minitest/growl_notify"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
require "minitest/rails/capybara"


# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
	include Capybara::DSL
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
  include Capybara::RSpecMatchers
  include Rails.application.routes.url_helpers
end