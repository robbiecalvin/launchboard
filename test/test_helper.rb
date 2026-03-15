ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

module AdminAuthenticationHelpers
  def admin_headers
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials("admin", "launchboard-demo")
    { "HTTP_AUTHORIZATION" => credentials }
  end
end

class ActionDispatch::IntegrationTest
  include AdminAuthenticationHelpers
end
