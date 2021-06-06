require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @user = users(:tony)
    @category = Category.new(category_name: "Entertainment", is_system: true, user_id: @user.id)
  end

  test "should be valid" do
    assert @category.valid?
  end

  test "user id should be present" do
    @category.user_id = nil
    assert_not @category.valid?
  end

  test "category name should be present" do
    @category.category_name = "   "
    assert_not @category.valid?
  end
end
