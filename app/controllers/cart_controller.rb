class CartController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :set_accessory, only: [:create, :increase, :decrease]

  def index
    @accessories = @cart.cart_accessories
  end

  def create
    accessory = Accessory.find(params[:accessory_id])

    @cart.add_accessory(params[:accessory_id])
    session[:cart] = @cart.contents

    flash[:success] = "You now have #{pluralize(session[:cart][accessory.id.to_s], accessory.name)} in your cart."
    redirect_to accessories_path
  end

  def increase
    @cart.add_accessory(params[:accessory_id])
    flash[:success] = "You have added 1 #{@accessory.name}"
    redirect_to cart_index_path
  end

  def decrease
    @cart.lose_accessory(params[:accessory_id])
    flash[:alert] = "You have lost 1 #{@accessory.name}"
    redirect_to cart_index_path
  end

  private

    def set_accessory
      @accessory = Accessory.find(params[:accessory_id])
    end

end
