class Station < ApplicationRecord
  validates_presence_of :name,
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

  def most_frequent_destination
    if !start_trip_stations.group(:end_station_id).order('count(id)').count.empty?
      Station.find(start_trip_stations.group(:end_station_id).order('count(id) DESC').count.first.first).name
    else
      "N/A"
    end
  end

  def most_frequent_origination
    if !end_trip_stations.group(:start_station_id).order('count(id)').count.empty?
      Station.find(end_trip_stations.group(:start_station_id).order('count(id) DESC').count.first.first).name
    else
      "N/A"
    end
  end

  def date_with_most_rides_started
    unless start_trip_stations.group(:start_date).order('count(id)').count.empty?
      start_trip_stations.group(:start_date).order('count(id) DESC').count.first.first.strftime("%m/%d/%Y")
    end
  end

  def most_frequent_zip_code
    unless start_trip_stations.group(:zip_code).order('count(id)').count.empty?
      start_trip_stations.group(:zip_code).order('count (id) DESC').count.first.first
    end
  end

  def most_frequent_bike
    unless start_trip_stations.group(:bike_id).order('count(id)').count.empty?
      start_trip_stations.group(:bike_id).order('count(id) DESC').count.first.first
    end
  end
end
