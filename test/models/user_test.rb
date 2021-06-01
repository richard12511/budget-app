require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Test User", email: "test@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "name should be minimum length" do
    @user.name = " " * 61
    assert_not @user.valid?
  end

  test "email should be minimum length" do
    @user.name = "a" * 255 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[richard@example.com tony@test.com mary@example.com]
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    addresses = %w[richard test@example,com test@example. test@ex+ample.com]
    addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address.inspect} should not be valid"
    end
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

end
