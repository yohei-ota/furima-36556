class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :redirect_root, only: [:edit, :update]
  
  def index
    @items = Item.order("id DESC")
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
    # 売却済みの条件分岐は商品購入機能実装の後に実装
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
  
  end

  
  private
  def item_params
    params.require(:item).permit(:item_name, :text, :price, :image,:category_id, :status_id, :cost_id, :area_id, :day_id).merge(user_id: current_user.id)
  end

  def redirect_root
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end