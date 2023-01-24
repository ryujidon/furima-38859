class ItemsController < ApplicationController
  def index
    @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to_ root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :image, :price, :explanation, :category_id ,:item_state_id, :delivery_charge_id, :place_id, :delivery_date_id).merge(user_id: current_user.id)
  end

end
