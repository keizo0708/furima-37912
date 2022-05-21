class ItemsController < ApplicationController
  def index
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

  private
  def params_item
    params.require(:item).permit(:name, :content, :category_id, :condition_id, :charge_id, :county_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end
end
