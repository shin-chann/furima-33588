class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :set_item, only:[:edit, :update]
  before_action :move_to_session, only:[:edit, :update]
  before_action :move_to_index , only:[:edit, :update]
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
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :explanation, :category_id, :state_id, :burden_id, :area_id, :number_of_time_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_session
    if current_user.id == @item.user_id
      redirect_to new_user_session_path
    end
  end

  def move_to_index
    if user_signed_in? && current_user.id
      redirect_to root_path
    end
  end
end
