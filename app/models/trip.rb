class Trip < ApplicationRecord
  belongs_to :condition
  belongs_to :start_station, class_name: "Station"
  belongs_to :end_station, class_name: "Station"

  validates_presence_of :duration,
                        :start_date,
                        :start_station,
                        :end_date,
                        :end_station,
                        :bike_id,
                        :subscription_type

  scope :sort_by_duration, -> { order(duration: :asc) }

  def self.average_duration
    average(:duration).round(2)
  end

  def self.station_with_most_starts
    group(:start_station).order('count(id) DESC').count.first.first
  end

  def self.station_with_most_ends
    group(:end_station).order('count(id) DESC').count.first.first
  end

  def self.rides_by_month
    group("DATE_TRUNC('month', start_date)").count.transform_keys do |key|
      key.strftime("%B")
    end
  end

  def self.rides_by_year
    group("DATE_TRUNC('year', start_date)").count.transform_keys do |key|
      key.year
    end
  end

  def self.bike_with_most_rides
    group(:bike_id).order("count(id) DESC").count.first
  end

  def self.bike_with_least_rides
    group(:bike_id).order("count(id)").count.first
  end

  def self.rides_by_subscription
    group(:subscription_type).count
  end

  def self.date_with_most_rides
    group(:start_date).order("count(id) DESC").count.first
  end

  def self.date_with_fewest_rides
    group(:start_date).order("count(id)").count.first
  end

  def self.weather_for_date_with_most_rides
    Condition.find_by(date: date_with_most_rides.first)
  end

  def self.weather_for_date_with_fewest_rides
    Condition.find_by(date: date_with_fewest_rides.first)
  end
end
