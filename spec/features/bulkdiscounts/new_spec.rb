require "rails_helper"

RSpec.describe " New Bulk Discount", type: :feature do
  before do
    @merchant = create :merchant
  end

  it "has form for new discount", :vcr do
    visit merchant_bulkdiscounts_path(@merchant)
    click_link("Create New Discount")
    expect(page).to have_current_path(new_merchant_bulkdiscount_path(@merchant))

    fill_in 'Quantity', with: 50
    fill_in 'Percent discount', with: 0.3
    click_button 'Submit'
    expect(page).to have_current_path(merchant_bulkdiscounts_path(@merchant))
    expect(page).to have_content("Quantity: 50")
    expect(page).to have_content("Discount: 30.0%")
  end

  it "rejects incomplete discounts", :vcr do
    visit merchant_bulkdiscounts_path(@merchant)
    click_link("Create New Discount")
    expect(page).to have_current_path(new_merchant_bulkdiscount_path(@merchant))

    fill_in 'Quantity', with: "A"
    click_button 'Submit'

    expect(page).to have_current_path(new_merchant_bulkdiscount_path(@merchant))
    expect(page).to have_content("Error")
  end
end
