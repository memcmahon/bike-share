class Station < ApplicationRecord
  validates_presence_of :name,
                        :lat,
                        :long,
                        :dock_count,
                        :city,
                        :installation_date
                        
  has_many :start_trip_stations, class_name: "Trip", foreign_key: "start_station_id"
  has_many :end_trip_stations, class_name: "Trip", foreign_key: "end_station_id"

  scope :sort_by_installation_date , -> { order(installation_date: :asc)}
  before_save :generate_slug

  def generate_slug
    self.slug = name.parameterize if name
  end

  def self.most_bikes_available_at_a_station 
    most_bikes = maximum(:dock_count)
  end

  def self.stations_with_most_bikes_available
    where(dock_count: most_bikes_available_at_a_station).pluck(:name)
  end

  def self.fewest_bikes_available_at_a_station 
    fewest_bikes = minimum(:dock_count)
  end

  def self.stations_with_fewest_bikes_available
    where(dock_count: fewest_bikes_available_at_a_station).pluck(:name)
  end

end
























