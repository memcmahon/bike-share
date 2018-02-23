class RemoveStationNameFromTrips < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :start_station_name
    remove_column :trips, :end_station_name
  end
end
