class OrdersController < ApplicationController

  def index
    @order_send_address = OrderSendAddress.new
  end

  # def new
  #   @order_send_address = OrderSendAddress.new
  # end


  def create
    @order_send_address = OrderSendAddress.new(order_params)
    if @order_send_address.valid?
      @order_send_address.save
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_send_address).permit(:postal_code, :place_id, :city, :address, :building_name, :telephone).merge(user_id: current_user.id)
  end
  
end