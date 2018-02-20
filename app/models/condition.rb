class Condition < ApplicationRecord
  has_many :trips

  validates_presence_of :date

  def month_day_converter
    date.strftime('%B %d, %Y')
  end

  def self.trips_with_max_temp(temp)
    where(max_temp_f: temp).
    joins(:trips).
    group(:date).
    order("count(*) DESC").
    count.
    values
  end

  def self.avg_trips_max_temp(temp)
    trips = trips_with_max_temp(temp).sum
    days = trips_with_max_temp(temp).count
    days == 0 ? 0 : (trips / days).round(2)
  end

  def self.extremum_trips_max_temp(extremum, range)
    return 0 if trips_with_max_temp(range).empty?
    if extremum == 'min'
      trips_with_max_temp(range).last
    elsif extremum == 'max'
      trips_with_max_temp(range).first
    else
      0
    end
  end

  def self.trips_with_precipitation(inches)
    where(precipitation_inches: inches).
    joins(:trips).
    group(:date).
    order("count(*) DESC").
    count.
    values
  end

  def self.avg_trips_precipitation(inches)
    trips = trips_with_precipitation(inches).sum
    days = trips_with_precipitation(inches).count
    days == 0 ? 0 : (trips/days).round(2)
  end

  def self.extremum_trips_precipitation(extremum, inches)
    return 0 if trips_with_precipitation(inches).empty?
    if extremum == 'min'
      trips_with_precipitation(inches).last
    elsif extremum == 'max'
      trips_with_precipitation(inches).first
    else
      0
    end
  end

  def self.trips_wind_speed(mph)
    where(mean_wind_speed_mph: mph).
    joins(:trips).
    group(:date).
    order("count(*) DESC").
    count.
    values
  end

  def self.avg_trips_wind_speed(mph)
    trips = trips_wind_speed(mph).sum
    days = trips_wind_speed(mph).count
    days == 0 ? 0 : (trips/days).round(2)
  end

  def self.extremum_trips_wind_speed(extremum, mph)
    return 0 if trips_wind_speed(mph).empty?
    if extremum == 'min'
      trips_wind_speed(mph).last
    elsif extremum == 'max'
      trips_wind_speed(mph).first
    else
      0
    end
  end

  def self.trips_visibility(miles)
    where(mean_visibility_miles: miles).
    joins(:trips).
    group(:date).
    order("count(*) DESC").
    count.
    values
  end

  def self.avg_trips_visibility(miles)
    trips = trips_visibility(miles).sum
    days = trips_visibility(miles).count
    days == 0 ? 0 : (trips/days).round(2)
  end

  def self.extremum_trips_visibility(extremum, miles)
    return 0 if trips_visibility(miles).empty?
    if extremum == 'min'
      trips_visibility(miles).last
    elsif extremum == 'max'
      trips_visibility(miles).first
    else
      0
    end
  end

end
