class Admin::BaseController < ApplicationController
  before_action :require_admin

private
  def require_admin
    if current_user
      render file: 'public/404' unless current_user.admin?
    else
      render file: 'public/404'
    end
  end
end
