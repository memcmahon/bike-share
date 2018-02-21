class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :print_range

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def print_range(range)
    range.to_s.split('..').join(' - ')
  end
end
