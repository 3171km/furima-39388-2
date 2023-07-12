class ItemsController < ApplicationController
  
before_action :authenticate_user!, only: [:new, :edit, :destroy, :show]
before_action :find_item, only: [:show, :edit, :update, :destroy]
before_action :check_user, only: [:edit, :destroy]

def index 
  @items = Item.all.order(created_at: :desc)
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
  @comments = @item.comments.includes(:user)
  @comment = Comment.new
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
  params.require(:item).permit(:image, :title, :overview, :category_id, :status_id, :burden_id, :region_id, :shipment_id,:price).merge(user_id: current_user.id)
end

def find_item
  @item = Item.find(params[:id])
end

def check_user
  redirect_to root_path if current_user.id != @item.user_id || @item.buyer.present?
end
end