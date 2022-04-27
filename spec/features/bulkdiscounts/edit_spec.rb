require "rails_helper"

RSpec.describe " New Bulk Discount", type: :feature do
  before do
    @merchant = create :merchant
    @bulk1 = create :bulkdiscount, {merchant_id: @merchant.id}
  end

  it "has form to edit discount", :vcr do
    visit merchant_bulkdiscount_path(@merchant, @bulk1)
    click_link("Update Discount")
    expect(page).to have_current_path(edit_merchant_bulkdiscount_path(@merchant, @bulk1))

    fill_in 'Quantity', with: 40
    fill_in 'Percent discount', with: 0.4
    click_button 'Save'

    expect(page).to have_current_path(merchant_bulkdiscount_path(@merchant, @bulk1))
    expect(page).to have_content("Quantity: 40")
    expect(page).to have_content("Discount: 40.0%")
  end
end
