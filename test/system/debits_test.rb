require "application_system_test_case"

class DebitsTest < ApplicationSystemTestCase
  setup do
    @debit = debits(:one)
  end

  test "visiting the index" do
    visit debits_url
    assert_selector "h1", text: "Debits"
  end

  test "creating a Debit" do
    visit debits_url
    click_on "New Debit"

    fill_in "Amount", with: @debit.amount
    fill_in "Currency", with: @debit.currency
    fill_in "Frequency", with: @debit.frequency
    fill_in "Remarks", with: @debit.remarks
    fill_in "User", with: @debit.user_id
    click_on "Create Debit"

    assert_text "Debit was successfully created"
    click_on "Back"
  end

  test "updating a Debit" do
    visit debits_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @debit.amount
    fill_in "Currency", with: @debit.currency
    fill_in "Frequency", with: @debit.frequency
    fill_in "Remarks", with: @debit.remarks
    fill_in "User", with: @debit.user_id
    click_on "Update Debit"

    assert_text "Debit was successfully updated"
    click_on "Back"
  end

  test "destroying a Debit" do
    visit debits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Debit was successfully destroyed"
  end
end
