class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @item = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params_item)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def params_item
    params.require(:item).permit(:name, :content, :category_id, :condition_id, :charge_id, :county_id, :day_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
