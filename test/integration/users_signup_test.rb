require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup info" do
    get signup_path
    assert_no_difference('User.count') do 
      post users_path, params: { user: { name: " ", email: "richard@example", password: "pass", password_confirmation: "word" }}
    end  

    assert_template 'users/new'
  end

  test "valid signup" do
    get signup_path
    assert_difference('User.count', 1) do
      post users_path, params: {user: { name: "Frank", email: "frank@example.com", password: "password123", password_confirmation: "password123"}}
    end

    user = User.find_by(email: "frank@example.com")

    assert_redirected_to(controller: "users", action: "show", id: user.id)
  end
end
