require 'test_helper'

class DebitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @debit = debits(:tony_1)
    @user = users(:tony)
    @category = categories(:one)
  end

  test "should get index" do
    login_as(@user)
    get debits_url
    assert_response :success
  end

  test "should get new" do
    login_as(@user)
    get new_debit_url
    assert_response :success
  end

  test "should create debit" do
    login_as(@user)
    assert_difference('Debit.count') do
      post debits_url, params: { debit: { amount: @debit.amount, currency: @debit.currency, frequency: @debit.frequency, remarks: @debit.remarks, user_id: @debit.user_id, category_id: @category.id } }
    end

    assert_redirected_to debit_url(Debit.last)
  end

  test "should show debit" do
    login_as(@user)
    get debit_url(@debit)
    assert_response :success
  end

  test "should get edit" do
    login_as(@user)
    get edit_debit_url(@debit)
    assert_response :success
  end

  test "should update debit" do
    login_as(@user)
    patch debit_url(@debit), params: { debit: { amount: @debit.amount, currency: @debit.currency, frequency: @debit.frequency, remarks: @debit.remarks, user_id: @debit.user_id, category_id: @category.id } }
    assert_redirected_to debit_url(@debit)
  end

  test "should destroy debit" do
    login_as(@user)
    assert_difference('Debit.count', -1) do
      delete debit_url(@debit)
    end

    assert_redirected_to debits_url
  end
end
