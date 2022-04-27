class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice
  has_many :bulkdiscounts, through: :item

  validates :quantity, presence: true
  validates :unit_price, presence: true, numericality: true

  enum status: {"Pending" => 0, "Packaged" => 1, "Shipped" => 2}

end
