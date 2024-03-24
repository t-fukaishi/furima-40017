class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end


end

  #def destroy
    #item = Item.find(params[:id])
    #item.destroy
    #redirect_to root_path
  #end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :delivery_fee_payment_id,:prefecture_id, :delivery_duration_id, :price).merge(user_id: current_user.id)
  end
