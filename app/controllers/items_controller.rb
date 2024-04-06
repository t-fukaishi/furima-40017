class ItemsController < ApplicationController
  #ログインしていない人をログインページに遷移させる
  before_action :authenticate_user!, except: [:index, :show]
  #商品のデータを作る
  before_action :set_item, only: [:show, :edit, :update]
  #売れてたら編集ページに入らないようにトップページに遷移する
  before_action :redirect_if_sold_out, only: [:edit, :update]
  #出品者じゃない人を編集ページに入らないようにトップページに遷移する
  before_action :redirect_root, only:  [:edit, :update]

  
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
      #redirect_to new_item_path
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
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

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :delivery_fee_payment_id,
                                 :prefecture_id, :delivery_duration_id, :price).merge(user_id: current_user.id)
  end

  def redirect_if_sold_out
    #売れてたら編集ページに入らないようにトップページに遷移する
    if @item.purchase.present?  # purchaseが存在＝売却済み
      redirect_to root_path
    end
  end

  def redirect_root 
    #出品者じゃない人を編集ページに入らないようにトップページに遷移する
    if current_user.id != @item.user_id  
      redirect_to root_path  # トップページ（root_path）にリダイレクトします。
    end
  end
  

end


