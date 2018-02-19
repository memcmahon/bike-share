class StationsController < ApplicationController

  def index
    @stations = Station.all.paginate(page: params[:page], per_page: 30)
  end

end