require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @item = FactoryBot.build(:item)
  end

  context '商品情報が正しく保存されるとき' do
    it '全ての情報が正しく入力されていれば保存される' do
      expect(@item).to be_valid
    end
  end

  context '商品情報が保存されないとき' do
    it 'nameが空では保存されない' do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では保存されない' do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idが空では保存されない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'condition_idが空では保存されない' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it 'delivery_fee_payment_idが空では保存されない' do
      @item.delivery_fee_payment_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee payment can't be blank")
    end

    it 'prefecture_idが空では保存されない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'priceが空では保存されない' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300より小さいと保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it 'priceが9999999より大きいと保存できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it 'priceが整数でなければ保存できない' do
      @item.price = 300.1
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be an integer")
    end
  end
end

