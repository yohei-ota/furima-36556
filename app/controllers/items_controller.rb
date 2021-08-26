class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :redirect_root,      only: [:edit, :update, :destroy]
  before_action :item_find,          only: [:show, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private
  def item_params
    params.require(:item).permit(:item_name, :text, :price, :image, :category_id, :status_id, :cost_id, :area_id, :day_id).merge(user_id: current_user.id)
  end

  def redirect_root
    item_find
    if @item.bought_log.present? || current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def item_find
    @item = Item.find(params[:id])
  end
end