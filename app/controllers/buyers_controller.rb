class BuyersController < ApplicationController
  def create
    buyer = Buyer.create(buyer_params)
    redirect_to "/purchases/#{buyer.purchase.id}" 
  end

  private
  def buyer_params
    params.require(:buyer).permit(:postalcode, :prefecture_id, :city, :house_number, :building_name, :phone_number, :purchase).merge(user_id: current_user.id)
  end
end