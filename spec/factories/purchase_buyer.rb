FactoryBot.define do
  before do
  user = FactoryBot.create(:user)
  item = FactoryBot.create(:item, user_id: user.id)
  @buyer = FactoryBot.build(:buyer)
  end

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