class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update,:destroy]
  before_action :user_item, only: [:edit, :destroy]
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

  end

  def edit
  end  

  def update

       if @item.update(item_params)
         redirect_to item_path
       else
         render :edit
       end
  end  

  def destroy
    @item.delete
    redirect_to root_path
  end



  private

  def item_params
    params.require(:item).permit(:title, :image, :price, :explanation, :category_id ,:item_state_id, :delivery_charge_id, :place_id, :delivery_date_id).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
  def user_item
    if @item.user != current_user
    redirect_to  root_path
  end
end
end
