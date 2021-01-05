ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

require 'minitest/autorun'
require 'sidekiq/testing'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def sign_in_admin_header
    user = ENV['ADMIN_USER']
    pw = ENV['ADMIN_PASS']
    { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(user, pw) }
  end
end
