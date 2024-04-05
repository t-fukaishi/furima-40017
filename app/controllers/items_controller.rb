class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_sold_out, only: [:edit, :update]
  before_action :redirect_root, only: [:show]
  before_action :redirect_root, only: [:show]
  def index
    @items = Item.order('created_at DESC')
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
    return if user_signed_in? && current_user.id == @item.user_id

    redirect_to root_path
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
    if current_user.id == item.user_id
      item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :delivery_fee_payment_id,
                                 :prefecture_id, :delivery_duration_id, :price).merge(user_id: current_user.id)
  end

  def redirect_if_sold_out
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def redirect_root 
    @item = Item.find(params[:id])  # URLから商品IDを取得して、対象の商品を取得します。
    if @item.purchase.present? && current_user.id != @item.user_id  # purchaseが存在＝売却済み、かつ現在のユーザーが出品者ではない場合
      redirect_to root_path  # トップページ（root_path）にリダイレクトします。
    end
  end
  
  def redirect_root 
    @item = Item.find(params[:id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end


