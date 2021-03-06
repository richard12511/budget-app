require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin  = users(:tony)
    @non_admin = users(:amy)
  end

  test "index as admin including delete links" do
    login_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    first_page_of_users = User.all
    first_page_of_users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      # unless user == @admin
      #   assert_select 'a[href=?]', user_path(user), text: 'delete'
      # end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end
  end

  test "index as non-admin" do
    login_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end

end
