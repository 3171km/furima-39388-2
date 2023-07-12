class PurchasersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :find_item, only: [:index, :create]
  before_action :check_user, only: [:index]
  before_action :check_item, only: [:index, :create]
  
  def index
    @purchaser = Purchaser.new
  end

  def create
    @purchaser = Purchaser.new(purchaser_params)
    if @purchaser.valid?
       pay_item
    @purchaser.save
      redirect_to root_path
    else
      render :index
  end
  end

  private

  def purchaser_params
    params.require(:purchaser).permit(:zip_code, :region_id, :city, :address1, :address2, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def check_user
    redirect_to root_path if current_user.id == @item.user.id
  end

  def check_item
    redirect_to root_path if @item.buyer.present?
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: purchaser_params[:token],
      currency: 'jpy'
    )
  end
  end
