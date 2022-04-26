class Bulkdiscount < ApplicationRecord
  validates :quantity, presence: true
  validates :percent_discount, presence: true

  belongs_to :merchant

end
