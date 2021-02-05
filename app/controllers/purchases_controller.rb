class PurchasesController < ApplicationController
  before_action :set_item, only:[:index, :create]
  before_action :move_to_session, only:[:index, :create]
  before_action :move_to_index, only:[:index, :create]

  def index
    @purchase = PurchaseResidence.new
  end

  def create
    @purchase = PurchaseResidence.new(purchase_params)
    if @purchase.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_residence).permit(:postal, :area_id, :city, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.purchase.present?
      redirect_to root_path
    end
  end

  def move_to_session
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
end