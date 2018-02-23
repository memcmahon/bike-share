class Admin::StationsController < Admin::BaseController

  def index; end

  def new
    @station = Station.new
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      flash[:notice] = "Station created!"

      redirect_to station_path(@station.slug)
    else
      flash[:notice] = "Opps Something Went Wrong!"

      render :new
    end
  end

  private

    def station_params
      params.require(:station).permit(:name, :lat, :long, :dock_count, :city, :installation_date, :slug)
    end

end