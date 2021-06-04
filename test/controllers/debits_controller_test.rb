require 'test_helper'

class DebitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @debit = debits(:one)
    @user = users(:tony)
  end

  test "should get index" do
    get user_debits_url(@user)
    assert_response :success
  end

  test "should get new" do
    get new_user_debit_url(@user)
    assert_response :success
  end

  test "should create debit" do
    assert_difference('Debit.count') do
      post user_debits_url(@user), params: { debit: { amount: @debit.amount, currency: @debit.currency, frequency: @debit.frequency, remarks: @debit.remarks, user_id: @debit.user_id } }
    end

    assert_redirected_to user_debit_url(@user, Debit.last)
  end

  test "should show debit" do
    get user_debit_url(@user, @debit)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_debit_url(@user, @debit)
    assert_response :success
  end

  test "should update debit" do
    patch user_debit_url(@user, @debit), params: { debit: { amount: @debit.amount, currency: @debit.currency, frequency: @debit.frequency, remarks: @debit.remarks, user_id: @debit.user_id } }
    assert_redirected_to debit_url(@debit)
  end

  test "should destroy debit" do
    assert_difference('Debit.count', -1) do
      delete user_debit_url(@user, @debit)
    end

    assert_redirected_to debits_url
  end
end
