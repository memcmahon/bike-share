class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart

  helper_method :current_user, :print_range

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def print_range(range)
    range.to_s.split('..').join(' - ')
  end

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def check_user
    redirect_to root_path if !current_user
  end

end
