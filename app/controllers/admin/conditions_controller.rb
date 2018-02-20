class Admin::ConditionsController < Admin::BaseController

  def index
    @conditions = Condition.all.paginate(page: params[:page], per_page: 20)
  end

end
