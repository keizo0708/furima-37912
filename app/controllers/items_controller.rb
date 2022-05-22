class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :edit]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :move_to_index_from_edit, :destroy]
  before_action :move_to_index_from_edit, only: :edit

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
  end

  def edit
  end

  def destroy
    if @item.user.id == current_user.id
      @item.destroy
      redirect_to root_path
    end
  end

  def update
    if @item.update(params_item)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def move_to_index_from_edit
    redirect_to root_path if @item.user.id != current_user.id
  end

  def params_item
    params.require(:item).permit(:name, :content, :category_id, :condition_id, :charge_id, :county_id, :day_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
