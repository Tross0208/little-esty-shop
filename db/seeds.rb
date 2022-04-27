# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Merchant.destroy_all
Item.destroy_all
Customer.destroy_all
Invoice.destroy_all
InvoiceItem.destroy_all
Bulkdiscount.destroy_all

merchant1 = Merchant.create!(name: "Merchant1", enabled: true)
item1 = Item.create!(name: "Item1", description: "Item1 Description", unit_price: 10, merchant_id: merchant1.id)
item2 = Item.create!(name: "Item2", description: "Item2 Description", unit_price: 20, merchant_id: merchant1.id)
customer1 = Customer.create!(first_name:"Tim", last_name:"Allen")
invoice1 = Invoice.create!(customer_id: customer1.id, status: 2)
invoice_item1 = InvoiceItem.create!(invoice_id: invoice1.id, item_id: item1.id, quantity: 1, unit_price: 10)
invoice_item1 = InvoiceItem.create!(invoice_id: invoice1.id, item_id: item1.id, quantity: 10, unit_price: 20)
bulk1 = Bulkdiscount.create!(merchant_id: merchant1.id, quantity: 5, percent_discount: 0.5)
#bulk2 = Bulkdiscount.create!(merchant_id: merchant1.id, quantity: 1, percent_discount: 0.1)
