class ConditionsDashboardController < ApplicationController

  def index
    if current_user
      @conditions = Condition.all
    else
      flash[:notice] = "Please register or log in to visit this page"
      redirect_to root_path
    end
  end

end
