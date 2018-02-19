class StationsController < ApplicationController

  def index
    @stations = Station.all.paginate(page: params[:page], per_page: 30)
  end

  def show
    @station = Station.find_by(slug: params[:name])
   end
end