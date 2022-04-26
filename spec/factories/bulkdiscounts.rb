FactoryBot.define do
  factory :bulkdiscount do
    quantity { Faker::Number.between(from: 5, to: 40) }
    percent_discount { Faker::Number.between(from: 0.0, to: 0.5).round(2) }
    merchant { nil }
  end
end
