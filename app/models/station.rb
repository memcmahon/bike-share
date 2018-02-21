class Station < ApplicationRecord
  validates_presence_of :name,
                        :lat,
                        :long,
                        :dock_count,
                        :city,
                        :installation_date
                        
  before_save :generate_slug
  has_many :start_trip_stations, class_name: "Trip", foreign_key: "start_station_id"
  has_many :end_trip_stations, class_name: "Trip", foreign_key: "end_station_id"

  def generate_slug
    self.slug = name.parameterize if name
  end

  def self.total_count_of_stations
    count
  end

  def self.average_bikes_available_per_station
    average("dock_count").floor
  end

  def self.most_bikes_available_at_a_station 
    # most_bikes = maximum(:dock_count)
  end

  def self.stations_with_most_bikes_available
    where(dock_count: most_bikes_available_at_a_station).pluck(:name)
  end

end
























