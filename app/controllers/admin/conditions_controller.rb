class Admin::ConditionsController < Admin::BaseController
  before_action :set_condition, only: [:show, :destroy, :edit, :update]

  def index
    @conditions = Condition.all.paginate(page: params[:page], per_page: 20)
  end

  def show
  end

  def new
    @condition = Condition.new
  end

  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      flash[:notice] = "You have successfully created a condition"
      redirect_to condition_path(@condition)
    else
      flash[:notice] = "Unable to create condition. Please make sure date is filled in."
      render :new
    end
  end

  def edit
  end

  def update
    if @condition.update(condition_params)
      flash[:notice] = "You have successfully updated the condition"
      redirect_to condition_path(@condition)
    else
      flash[:notice] = "Unable to edit condition. Please make sure date is filled in."
      render :new
    end
  end

  def destroy
    if @condition.destroy
      flash[:notice] = "You have successfully deleted a condition."
      redirect_to admin_conditions_path
    end
  end


  private

    def condition_params
      params.require(:condition).permit(:max_temp_f,
                                        :min_temp_f,
                                        :mean_temp_f,
                                        :mean_humidity,
                                        :mean_visibility_miles,
                                        :mean_wind_speed_mph,
                                        :precipitation_inches,
                                        :date,
                                        :zip_code)
    end

    def set_condition
      @condition = Condition.find(params[:id])
    end
end
