require 'rails_helper'
RSpec.describe Buyer, type: :model do
  before do
    @buyer = FactoryBot.build(:purchase_buyer)
  end

  describe '配送情報登録' do
    context '新規登録できる場合' do
      it 'postalcode 、prefecture_id、city 、house_number、phone_numberが存在すれば登録できる' do
        expect(@buyer).to be_valid
      end
    end

    context '新規登録できない場合' do
      it '郵便番号が空では保存できない' do
      @buyer.postalcode = ''
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Postalcode can't be blank")
      end 

      it '郵便番号は、「3桁ハイフン4桁」の半角文字列でなければ保存できない' do
      @buyer.postalcode = '1234567'
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Postalcode is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it '都道府県が空では保存できない' do
      @buyer.prefecture_id = 0
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Prefecture can't be blank")
      end 

      it '市区町村が空では保存できない' do
      @buyer.city = ''
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("City can't be blank")
      end 

      it '番地が空では保存できない' do
      @buyer.house_number = ''
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("House number can't be blank")
      end 

      it '電話番号が空では保存できない' do
      @buyer.phone_number = ''
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Phone number can't be blank")
      end 

      it '電話番号は、10桁以上11桁以内の半角数値でなければ保存できない' do
      @buyer.phone_number = '090-1234-56789'
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Phone number is invalid")
      end 
    end
  end
end