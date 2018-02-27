class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  def show
    if current_user.admin?
      redirect_to admin_order_path(@order)
    elsif current_user.id == @order.user_id
    else
      flash[:notice] = "Stick to Your own orders!"
      redirect_to dashboard_path
    end
  end

  def create
    order = current_user.orders.create(status: 0,
                                       total: @cart.cart_subtotal)
    session[:cart].each do |id, quantity|
      order.order_accessories.create(order_id: order.id,
                                     accessory_id: id.to_i,
                                     quantity: quantity)
    end
    session[:cart] = nil
    flash[:success] = "Your order was successfully submitted"
    redirect_to dashboard_path
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end

end
