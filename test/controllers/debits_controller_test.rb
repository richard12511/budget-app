require 'test_helper'

class DebitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @debit = debits(:one)
    @user = users(:tony)
  end

  test "should get index" do
    get debits_url
    assert_response :success
  end

  test "should get new" do
    get new_debit_url
    assert_response :success
  end

  test "should create debit" do
    assert_difference('Debit.count') do
      post debits_url, params: { debit: { amount: @debit.amount, currency: @debit.currency, frequency: @debit.frequency, remarks: @debit.remarks, user_id: @debit.user_id } }
    end

    assert_redirected_to debit_url(Debit.last)
  end

  test "should show debit" do
    get debit_url(@debit)
    assert_response :success
  end

  test "should get edit" do
    get edit_debit_url(@debit)
    assert_response :success
  end

  test "should update debit" do
    patch debit_url(@debit), params: { debit: { amount: @debit.amount, currency: @debit.currency, frequency: @debit.frequency, remarks: @debit.remarks, user_id: @debit.user_id } }
    assert_redirected_to debit_url(@debit)
  end

  test "should destroy debit" do
    assert_difference('Debit.count', -1) do
      delete debit_url(@debit)
    end

    assert_redirected_to debits_url
  end
end
