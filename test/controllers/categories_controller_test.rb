require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:tony)
    @category = categories(:bills)
  end
  
  test "should get index" do
    login_as(@user)
    get categories_url
    assert_response :success
  end

  test "should get new" do
    login_as(@user)
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    login_as(@user)
    assert_difference('Category.count') do
      post categories_url, params: { category: { category_name: @category.category_name, is_system: @category.is_system, user_id: @category.user_id}}
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should show category" do
    login_as(@user)
    get category_url(@category)
    assert_response :success
  end

  test "should get category" do
    login_as(@user)
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    login_as(@user)
    patch category_url(@category), params: { category: { category_name: @category.category_name, is_system: @category.is_system, user_id: @user.id}}
    assert_redirected_to category_url(@category)
  end

  test "should destroy category" do
    login_as(@user)
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end

end
