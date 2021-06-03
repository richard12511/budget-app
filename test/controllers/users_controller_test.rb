require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:tony)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect to edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end
end
