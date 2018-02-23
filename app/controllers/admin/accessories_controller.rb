class Admin::AccessoriesController < Admin::BaseController

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

  private

  def accessory_params
    params.require(:accessory).permit(:price, :name, :description, :role)
  end

end
