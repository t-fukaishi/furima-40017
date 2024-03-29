require 'rails_helper'

RSpec.describe Purchase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

it '郵便番号が空では投稿できない' do
  @buyer.postalcode = ''
  @buyer.valid?
  expect(@buyer.errors.full_messages).to include("Postal code can't be blank")
end 

it '郵便番号が空では投稿できない' do
  @buyer.postalcode = ''
  @buyer.valid?
  expect(@buyer.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
end

