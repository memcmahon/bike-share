class ConditionsDashboardController < ApplicationController

  def index
    @conditions = Condition.all
  end

end
