class Admin::UsersController < Admin::BaseController
  def show
    @all_orders = Order.all
    if params[:sort]
      @orders = Order.where(status: params[:sort])
    else
      @orders = Order.all
    end
  end
end
