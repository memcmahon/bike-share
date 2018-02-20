class Admin::ConditionsController < Admin::BaseController

  def index
    @conditions = Condition.all
  end

end
