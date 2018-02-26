class StationsController < ApplicationController

  def index
    @stations = Station.all.paginate(page: params[:page], per_page: 30)
  end

  def show
    @station = Station.find_by(slug: params[:slug])
  end

  def edit
    @station = Station.find_by(slug: params[:slug])
  end

  def update
    @station = Station.find(params[:slug])
    @station.update(station_params)
    flash[:notice] = "#{@station.name} was updated"

    redirect_to station_path(@station.slug)
  end

  def destroy
    station = Station.find_by(slug: params[:slug])
    station.destroy
    flash[:notice] = "#{station.name} was deleted"

    redirect_to stations_path
  end

  private

    def station_params
      params.require(:station).permit(:name, :lat, :long, :dock_count, :city, :installation_date, :slug)
    end
end

