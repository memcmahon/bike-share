class Admin::OrdersController < Admin::BaseController
  before_action :set_order, only: [:show, :update]

  def show
  end

  def update
    @order.update(status: params[:status])
    redirect_to admin_dashboard_path
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end
end
