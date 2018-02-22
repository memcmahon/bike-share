class Admin::TripsController < Admin::BaseController
  before_action :set_trip, only: [:edit, :update]

  def destroy
    Trip.destroy(params[:id])
    redirect_to trips_path
  end

  def edit
    @conditions = Condition.all
  end

  def update
    @trip.update(trip_params)
    redirect_to trip_path(@trip)
  end

  private
    def set_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:id)
    end
end