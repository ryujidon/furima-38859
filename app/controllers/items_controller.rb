class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
    @item = Item.all.order(created_at: :desc)
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
    @item = Item.find(params[:id])
  end



  private

  def item_params
    params.require(:item).permit(:title, :image, :price, :explanation, :category_id ,:item_state_id, :delivery_charge_id, :place_id, :delivery_date_id).merge(user_id: current_user.id)
  end

end
