class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_index, only: [:edit, :update]
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
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :explanation, :category_id, :state_id, :burden_id, :area_id, :number_of_time_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in? && current_user.id == @item.user_id
  end
end
