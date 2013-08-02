ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
 	teardown do
    DatabaseCleaner.clean
  end

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  Capybara.app = Resourcer::Application

  setup do
    @topic = FactoryGirl.create :topic
    @source = FactoryGirl.create :source
    @skill = Skill.create topic: @topic, source: @source, name: "Beginner"
  end

  teardown do
    DatabaseCleaner.clean
  	Capybara.reset_sessions! # Forget the (simulated) browser state
  	Capybara.use_default_driver # reset the driver to the default incase its set to webkit in tests
  end
end
