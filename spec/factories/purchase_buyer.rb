FactoryBot.define do
  factory :purchase_buyer do
    association :purchase
    
    postalcode { '123-4567' }
    prefecture_id { 2 }
    city  { '福岡' }
    house_number { 2 }
    building_name { '博多' }
    phone_number  { '09012345678' }
    user_id { 2 }
    item_id { 2 }
  end
end