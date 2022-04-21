require "rails_helper"

RSpec.describe "Admin Dashboard", type: :feature do
  it "shows admin dash header", :vcr do
    visit "/admin"

    within("#admin-header") do
      expect(page).to have_content("Admin Dashboard")
    end
  end

  it "contains links to merchant and invoice admin views", :vcr do
    visit "/admin"

    within("#dashboard-links") do
      expect(page).to have_link("Merchants View", href: "/admin/merchants")
      expect(page).to have_link("Invoices View", href: "/admin/invoices")
    end
  end

  # it "shows a section for invoices that are incomplete", :vcr do
  #   merch = create(:merchant)
  #   item = create(:item, merchant: merch)
  #   customer = create(:customer)
  #   invoice1 = create(:invoice, customer: customer, status: 1)
  #   invoice2 = create(:invoice, customer: customer, status: 2)
  #   invoice_item1 = create(:invoice_item, invoice: invoice1, item: item, status: 1)
  #   invoice_item2 = create(:invoice_item, invoice: invoice1, item: item, status: 2)
  #
  #   visit "/admin"
  #
  #   within("#incomplete-invoices") do
  #     expect(page).to have_content(invoice1.id)
  #     expect(page).to have_link("admin/items/#{invoice1.id}")
  #   end
  # end

  # it "shows invoices that are incomplete with the date the invoice was created", :vcr do
  #   merch = create(:merchant)
  #   item = create(:item, merchant: merch)
  #   customer = create(:customer)
  #   invoice1 = create(:invoice, customer: customer, status: 1)
  #   invoice2 = create(:invoice, customer: customer, status: 2)
  #   invoice_item1 = create(:invoice_item, invoice: invoice1, item: item, status: 1)
  #   invoice_item2 = create(:invoice_item, invoice: invoice1, item: item, status: 2)
  #
  #   visit "/admin"
  #
  #   within("#incomplete-invoices") do
  #     expect(page).to have_content(invoice1.id)
  #     expect(page).to have_link("admin/items/#{invoice1.id}")
  #     expect(page).to have_content(@invoice_item1.invoice.created_at.strftime("%A, %B %d, %Y"))

  #   end
  # end
end
