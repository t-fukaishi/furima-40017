class PurchasesController < ApplicationController

  before_action :set_purchase, only: [:show]

  def index
   @purchase = PurchaseBuyer.new
  end

  def create
    @purchase = PurchaseBuyer.new(purchase_params)

    if @purchase.valid?
       @purchase.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @buyer = Buyer.new
    @buyers = @purchase.buyers.includes(:user)
  end

  private
  def purchase_params
    params.require(:purchase_buyer).permit(:postalcode, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end


# Parameters: {"authenticity_token"=>"[FILTERED]", 

#     "postalcode"=>"274-0825", 
#     "prefecture_id"=>"12", 
#     "city"=>"",
#     "house_number"=>"４－３４－１０",
#     "building_name"=>"", 
#     "phone_number"=>"09069277820"


# Parameters: {"authenticity_token"=>"[FILTERED]", 
#   "item"=>{
#     "image"=>#<ActionDispatch::Http::UploadedFile:0x00007fe9919ff010 @tempfile=#<Tempfile:/tmp/RackMultipart20240330-269052-7nqg4p.png>, 
#     "name"=>"test",
#     "description"=>"test",
#     "category_id"=>"2", 
#     "condition_id"=>"2", 
#     "delivery_fee_payment_id"=>"2",
#     "prefecture_id"=>"13", 
#     "delivery_duration_id"=>"2", 
#     "price"=>"3000"
#   },
#       "commit"=>"出品する"}