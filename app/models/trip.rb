class Trip < ApplicationRecord
  belongs_to :condition

  validates_presence_of :duration,
                        :start_date,
                        :start_station_name,
                        :start_station_id,
                        :end_date,
                        :end_station_name,
                        :end_station_id,
                        :bike_id,
                        :subscription_type

  scope :sort_by_duration, -> { order(duration: :asc) }

  def self.average_duration
    average(:duration)
  end

  def self.station_with_most_starts
    group(:start_station_name).order('count(id) DESC').count.first.first
  end

  def self.station_with_most_ends
    group(:end_station_name).order('count(id) DESC').count.first.first
  end

  def self.rides_by_month
    group("DATE_TRUNC('month', start_date)").count
  end

  def self.rides_by_year
    group("DATE_TRUNC('month', start_date)").count
  end
end
