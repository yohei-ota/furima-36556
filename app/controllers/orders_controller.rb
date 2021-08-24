class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @bought_log_bought_user = BoughtLogBoughtUser.new
  end

  def create
    @bought_log_bought_user = BoughtLogBoughtUser.new(bought_log_params)
    if @bought_log_bought_user.valid?
      P
      @bought_log_bought_user.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end


  private

  def bought_log_params
    params.require(:bought_log_bought_user).permit(:postal_code, :area_id, :munucipalities, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end

