require 'test_helper'

class DebitsTest < ActionDispatch::IntegrationTest

  def setup
    @admin  = users(:tony)
    @amy = users(:amy)
    @john = users(:john)

    @amy_debit = debits(:amy_1)
    @john_debit = debits(:john_1)
  end

  test "trying to view another user's debit redirects to root" do
    login_as(@amy)
    get debit_path(@john_debit)
    assert_redirected_to root_url
  end

  test "trying to view own debit is successful" do
    login_as(@amy)
    get debit_path(@amy_debit)
    assert_template 'debits/show'
  end
end
