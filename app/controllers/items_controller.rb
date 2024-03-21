class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path 
    else
      render :new, status: :unprocessable_entity 
    end
  end
#   def update
#     if @item.update(item_params)
#       redirect_to item_path(@item)
#     else
#       render :edit, status: :unprocessable_entity
#     end
#  end
#   def destroy
#     if @item.destroy
#       redirect_to root_path
#     else
#       redirect_to root_path
#     end
#   end



  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :delivery_fee_payment_id, :prefecture_id, :delivery_duration_id, :price).merge(user_id: current_user.id)
  end

end