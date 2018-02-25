class OrdersController < ApplicationController

  def create
    order = current_user.orders.create(status: "Ordered",
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

end
