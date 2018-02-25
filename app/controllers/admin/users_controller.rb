class Admin::UsersController < Admin::BaseController
  def show
    binding.pry
    @orders = Order.all
  end
end
