class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_root, except: :thank

  def index
    @bought_log_bought_user = BoughtLogBoughtUser.new
  end

  def create
    @bought_log_bought_user = BoughtLogBoughtUser.new(bought_log_params)
    if @bought_log_bought_user.valid?
      pay_item
      @bought_log_bought_user.save
      redirect_to thank_item_orders_path
    else
      render :index
    end
  end

  def thank
    @item = Item.find(params[:item_id])
  end


  private

  def bought_log_params
    params.require(:bought_log_bought_user).permit(:postal_code, :area_id, :munucipalities, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: @bought_log_bought_user.token,
      currency: 'jpy'
    )
  end

  def redirect_root
    @item = Item.find(params[:item_id])
    if @item.bought_log.present? || current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end

