def zeus_running?
  File.exists? '.zeus.sock'
end
 
if !zeus_running?
  require 'simplecov'
  SimpleCov.start 'rails'
end

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
#require 'rspec/autorun'
require 'mongoid-rspec'
require 'database_cleaner'
require 'ffaker'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include Mongoid::Matchers
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "default"

  config.before :each do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end

