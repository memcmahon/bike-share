class Admin::ConditionsController < Admin::BaseController
  before_action :set_condition, only: [:show, :destroy]

  def index
    @conditions = Condition.all.paginate(page: params[:page], per_page: 20)
  end

  def show
  end

  def new
    @condition = Condition.new
  end

  def destroy
    if @condition.destroy
      flash[:notice] = "You have successfully deleted a condition."
      redirect_to admin_conditions_path
    end
  end


  private

    def set_condition
      @condition = Condition.find(params[:id])
    end
end
