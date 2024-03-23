FactoryBot.define do
  factory :item do
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    name { 'ぬいぐるみ' }
    description { 'ぬいぐるみの説明' }
    price { 400_000 }
    category_id { 2 }
    condition_id { 2 }
    delivery_fee_payment_id { 2 }
    prefecture_id { 2 }
    delivery_duration_id { 2 }
  end
end
