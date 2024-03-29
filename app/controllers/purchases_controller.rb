class PurchasesController < ApplicationController

  before_action :set_purchase, only: [:show]

  def index
    @purchase_form = PurchaseForm.new
  end

  def create
    Purchase.create(purchase_params)
  end

  def show
    @buyer = Buyer.new
    @buyers = @purchase.buyers.includes(:user)
  end

  private
  def purchase_params
    params.require(:purchase).permit(:user, :item).merge(user_id: current_user.id)
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
