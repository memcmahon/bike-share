class StationsController < ApplicationController

  def index
    @stations = Station.all.paginate(page: params[:page], per_page: 30)
  end

  def show
    @station = Station.find_by(slug: params[:slug])
  end

  def destroy
    station = Station.find(params[:slug])
    station.destroy
    flash[:notice] = "#{station.name} was deleted"

    redirect_to stations_path
  end
end