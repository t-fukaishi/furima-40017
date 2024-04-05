FactoryBot.define do

factory :purchase_buyer do
    
    postalcode { '123-4567' }
    prefecture_id { 2 }
    city  { '福岡' }
    house_number { 2 }
    building_name {'建物'}
    phone_number  { '09012345678' }
    token { "tok_abcdefghijk00000000000000000" }
  end
end