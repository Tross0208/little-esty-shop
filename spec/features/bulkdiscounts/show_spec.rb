require "rails_helper"

RSpec.describe "Bulk Discount show", type: :feature do
  before do
    @merchant = create :merchant
    @bulk1 = create :bulkdiscount, {merchant_id: @merchant.id}
    @bulk2 = create :bulkdiscount, {merchant_id: @merchant.id}
  end

  it "shows discount attributes", :vcr do
    visit merchant_bulkdiscount_path(@merchant, @bulk1)

    expect(page).to have_content(@bulk1.quantity)
    expect(page).to have_content(@bulk1.percent_discount)
  end
end
