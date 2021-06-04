require 'test_helper'

class DebitTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:tony)

    @debit = Debit.new(currency: "USD", frequency: "One Time", remarks: "test", amount: 9.99, user_id: @user.id )
  end

  test "should be valid" do
    assert @debit.valid?
  end

  test "user id should be present" do
    @debit.user_id = nil
    assert_not @debit.valid?
  end

  test "amount should be present" do
    @debit.amount = nil
    assert_not @debit.valid?
  end

  test "currency should be present" do
    @debit.currency = nil
    assert_not @debit.valid?
  end

  test "frequency should be present" do
    @debit.frequency = nil
    assert_not @debit.valid?
  end
end
