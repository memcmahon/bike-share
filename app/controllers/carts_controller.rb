class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def show

  end

  def create
    accessory = Accessory.find(params[:accessory_id])

    @cart.add_accessory(params[:accessory_id])
    session[:cart] = @cart.contents

    flash[:success] = "You now have #{pluralize(session[:cart][accessory.id.to_s], accessory.name)} in your cart."
    redirect_to accessories_path
  end

end
