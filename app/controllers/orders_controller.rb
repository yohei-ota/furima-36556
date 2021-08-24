class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_root

  def index
    @item = Item.find(params[:item_id])
    @bought_log_bought_user = BoughtLogBoughtUser.new
  end

  def create
    @bought_log_bought_user = BoughtLogBoughtUser.new(bought_log_params)
    @item = Item.find(params[:item_id])
    if @bought_log_bought_user.valid?
      pay_item
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

  def pay_item
    Payjp.api_key = "環境変数化の時に記述"
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

