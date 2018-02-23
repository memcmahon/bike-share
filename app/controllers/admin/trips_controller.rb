class Admin::TripsController < Admin::BaseController
  before_action :set_trip, only: [:edit, :update]

  def new
    @trip = Trip.new()
    @stations = Station.all
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.condition_id = Condition.find_by(date: @trip.start_date).id if Condition.find_by(date: @trip.start_date)
    if @trip.save
      flash[:notice] = "Success - you have created a trip."
      redirect_to trip_path(@trip)
    else
      flash[:notice] = "Unable to create trip"
      render :new
    end
  end

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
      params.require(:trip).permit(:id, :duration, :start_date, :start_station_id, :end_date, :end_station_id, :bike_id, :subscription_type, :zip_code, :condition)
    end
end
