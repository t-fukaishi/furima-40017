class PurchasesController < ApplicationController

  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  before_action :redirect_if_not_eligible, only: [:index]
  
  def index
   gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
   @purchase = PurchaseBuyer.new

  end

  def create
    @purchase = PurchaseBuyer.new(purchase_params)


    if @purchase.valid?
      
      pay_item
  
       @purchase.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

 private
  def purchase_params
    params.require(:purchase_buyer).permit(:postalcode, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id,item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],     # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end


  def set_item
    @item = Item.find(params[:item_id])
  end
  def redirect_if_not_eligible
    if current_user.id == @item.user.id || @item.purchase.present?
      redirect_to root_path
    end
  end

end
