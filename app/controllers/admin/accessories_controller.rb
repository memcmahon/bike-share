class Admin::AccessoriesController < Admin::BaseController
  before_action :set_accessory, only: [:edit, :update, :destroy]

  def new
    @accessory = Accessory.new
  end

  def create
    @accessory = Accessory.new(accessory_params)
    if @accessory.save
      flash[:success] = "You have successfully created an accessory"
      redirect_to accessory_path(@accessory)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @accessory.update!(accessory_params)
      flash[:success] = "You have successfully updated #{@accessory.name}"
      redirect_to accessories_path
    else
      flash[:alert] = "Something went wrong. Please try again."
      render :new
    end
  end

  def destroy
    if @accessory.destroy
      flash[:success] = 'Accessory successfully deleted'
      redirect_to accessories_path
    else
      flash[:alert] = "Something went wrong"
      redirect_to accessories_path
    end
  end

  private

  def accessory_params
    params.require(:accessory).permit(:price, :name, :description, :role, :avatar)
  end

  def set_accessory
    @accessory = Accessory.find(params[:id])
  end

end
