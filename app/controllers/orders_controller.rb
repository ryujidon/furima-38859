class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index]


  def index
    @order_send_address = OrderSendAddress.new
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to  root_path
    end
  end

  # def new
  #   @order_send_address = OrderSendAddress.new
  # end


  def create

    @order_send_address = OrderSendAddress.new(order_params)
    @item = Item.find(params[:item_id])

    if @order_send_address.valid?
      pay_item
      @order_send_address.save
      return redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_send_address).permit(:postal_code, :place_id, :city, :address, :building_name, :telephone).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end
  
  def pay_item
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end