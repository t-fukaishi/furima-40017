class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
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
  end
  
  def edit
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end
  
 def set_item
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item) 
  else
      render :edit, status: :unprocessable_entity
  end
end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :delivery_fee_payment_id,:prefecture_id, :delivery_duration_id, :price).merge(user_id: current_user.id)
  end
end