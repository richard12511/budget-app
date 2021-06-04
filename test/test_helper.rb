ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)
  # parallelize(workers: 1)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  require "minitest/reporters"
  Minitest::Reporters.use!

  def islogged_in?
    !session[:user_id].nil?
  end

  def login_as(user)
    session[:user_id] = user.id
  end
end


class ActionDispatch::IntegrationTest

  # Log in as a particular user
  def login_as(user, password: 'password123')
    post login_path, params: { session: { email: user.email, password: password } }
  end
end