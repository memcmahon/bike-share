class Admin::BaseController < ApplicationController
  before_action :require_admin

private
  def require_admin
    if current_user
      render file: 'public/404' unless current_user.admin?
      flash[:notice] = "Must be admin to view this page"
    else
      render file: 'public/404'
      flash[:notice] = "Must be admin to view this page"
    end
  end
end
