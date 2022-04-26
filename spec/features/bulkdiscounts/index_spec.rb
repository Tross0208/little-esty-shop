require "rails_helper"

RSpec.describe "Bulk Discount index", type: :feature do
  before do
    @merchant = create :merchant
    @bulk1 = create :bulkdiscount, {merchant_id: @merchant.id}

  end
  describe "display" do
    it "displays discount info" do
      visit merchant_bulkdiscounts_path(@merchant)
      expect(page).to have_content(@bulk1.quantity)
      expect(page).to have_content(@bulk1.percent_discount * 100)
    end
  end
end
