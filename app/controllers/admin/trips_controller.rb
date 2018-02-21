class Admin::TripsController < Admin::BaseController
  def destroy
    Trip.destroy(params[:id])
    redirect_to trips_path
  end
end
