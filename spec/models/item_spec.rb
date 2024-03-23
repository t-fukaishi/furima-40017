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
    it 'nameが空では保存されないこと' do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では保存されないこと' do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'categoryを選択していないと保存できないこと' do
      @item.category= 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'conditionを選択していないと保存できないこと' do
      @item.condition= 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it 'delivery_fee_paymentを選択していないと保存できないこと' do
      @item.delivery_fee_payment= 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee payment can't be blank")
    end

    it 'prefectureを選択していないと保存できないこと' do
      @item.prefecture = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")

    it 'delivery_durationを選択していないと保存できないこと' do
      @item.delivery_duration = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("delivery duration can't be blank")


    it 'priceが空では保存されないこと' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300より小さいと保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it 'priceが9999999より大きいと保存できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it 'priceが整数でなければ保存できないこと' do
      @item.price = 300.1
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be an integer")
    end

    it 'priceが半角数値以外が含まれている場合登録できないこと' do
      @item.price = aaa
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be an integer")
    end

    it 'userが紐付いていないと保存できないこと' do
      @item.user_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User can't be blank")
    end

    it '画像が空の場合登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User can't be blank")
    end
    
  end
end