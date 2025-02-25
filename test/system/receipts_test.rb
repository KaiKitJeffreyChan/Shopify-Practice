require "application_system_test_case"

class ReceiptsTest < ApplicationSystemTestCase
  setup do
    @receipt = receipts(:one)
  end

  test "visiting the index" do
    visit receipts_url
    assert_selector "h1", text: "Receipts"
  end

  test "should create receipt" do
    visit receipts_url
    click_on "New receipt"

    fill_in "Purchase date", with: @receipt.purchase_date
    fill_in "Purchase time", with: @receipt.purchase_time
    fill_in "Retailer", with: @receipt.retailer
    fill_in "Total", with: @receipt.total
    click_on "Create Receipt"

    assert_text "Receipt was successfully created"
    click_on "Back"
  end

  test "should update Receipt" do
    visit receipt_url(@receipt)
    click_on "Edit this receipt", match: :first

    fill_in "Purchase date", with: @receipt.purchase_date
    fill_in "Purchase time", with: @receipt.purchase_time.to_s
    fill_in "Retailer", with: @receipt.retailer
    fill_in "Total", with: @receipt.total
    click_on "Update Receipt"

    assert_text "Receipt was successfully updated"
    click_on "Back"
  end

  test "should destroy Receipt" do
    visit receipt_url(@receipt)
    click_on "Destroy this receipt", match: :first

    assert_text "Receipt was successfully destroyed"
  end
end
