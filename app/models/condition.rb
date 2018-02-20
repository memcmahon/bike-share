class Condition < ApplicationRecord
  has_many :trips

  validates_presence_of :date

  def month_day_converter
    date.strftime('%B %d, %Y')
  end

  def self.trips_with_max_temp(temp)
    joins(:trips).where(max_temp_f: temp)
  end

  def self.avg_trips_max_temp(temp)
    trips = trips_with_max_temp(temp).count
    days = where(max_temp_f: temp).count
    days == 0 ? 0 : (trips / days).round(2)
  end

  def self.extremum_trips_max_temp(temp, order)
    trips_with_max_temp(temp).
    group(:date).
    order("count(*) #{order}").
    count.
    first.
    last
  end

  def self.trips_with_precipitation(inches)
    joins(:trips).where(precipitation_inches: inches)
  end

  def self.avg_trips_precipitation(inches)
    trips = trips_with_precipitation(inches).count
    days = where(precipitation_inches: inches).count
    days == 0 ? 0 : (trips/days).round(2)
  end

  def self.extremum_trips_precipitation(inches, order)
    trips_with_precipitation(inches).
    group(:date).
    order("count(*) #{order}").
    count.
    first.
    last
  end

  def self.trips_wind_speed(mph)
    joins(:trips).where(mean_wind_speed_mph: mph)
  end

  def self.avg_trips_wind_speed(mph)
    trips = trips_wind_speed(mph).count
    days = where(mean_wind_speed_mph: mph).count
    days == 0 ? 0 : (trips/days).round(2)
  end

  def self.extremum_trips_wind_speed(mph, order)
    trips_wind_speed(mph).
    group(:date).
    order("count(*) #{order}").
    count.
    first.
    last
  end

  def self.trips_visibility(miles)
    joins(:trips).where(mean_visibility_miles: miles)
  end

  def self.avg_trips_visibility(miles)
    trips = trips_visibility(miles).count
    days = where(mean_visibility_miles: miles).count
    days == 0 ? 0 : (trips/days).round(2)
  end

  def self.extremum_trips_visibility(miles, order)
    trips_visibility(miles).
    group(:date).
    order("count(*) #{order}").
    count.
    first.
    last
  end

end
