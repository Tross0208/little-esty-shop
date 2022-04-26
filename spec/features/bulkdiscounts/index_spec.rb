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
    it "links to discount show" do
      visit merchant_bulkdiscounts_path(@merchant)
      expect(page).to have_link("Discount 1")

      click_link "Discount 1"
      expect(current_path).to eq(merchant_bulkdiscount_path(@merchant, @bulk1))
    end
  end
end
