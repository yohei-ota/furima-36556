class ItemsController < ApplicationController

  def index
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def item_params
    prams.require(:item)
         .permit(:item_name, :text,:price)
         .merge(:category_id, :status_id, :cost_id, :area_id, :days_id, user_id: current_user.id)
  end
end
