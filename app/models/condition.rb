class Condition < ApplicationRecord
  has_many :trips

  validates_presence_of :date

  def month_day_converter
    date.strftime('%B %d, %Y')
  end

  def self.trip_counts(attribute)
    where(attribute).
    joins(:trips).
    group(:date).
    order("count(*) DESC").
    count.
    values
  end

  def self.avg_trips(range)
    trips = trip_counts(range).sum
    days = trip_counts(range).count
    days == 0 ? 0 : (trips / days).round(2)
  end

  def self.trips_extremums(extremum, range)
    return 0 if trip_counts(range).empty?
    if extremum == 'min'
      trip_counts(range).last
    elsif extremum == 'max'
      trip_counts(range).first
    else
      0
    end
  end

  def self.set_ranges(min, max, incrementor)
    ranges = []
    until min > max
      ranges << [min, (min+incrementor)]
      min += incrementor
    end
    ranges
  end

  def self.round_down(number)
    (number / 10).floor * 10
  end

  def self.ranges(min, max, incrementor)
    set_ranges(min, max, incrementor).map do |range|
      Range.new(range[0], range[1])
    end
  end

  def self.temp_extremums
    [round_down(minimum(:max_temp_f)), maximum(:max_temp_f).round(-1)]
  end

  def self.wind_speed_extremums
    [round_down(minimum(:mean_wind_speed_mph)), maximum(:mean_wind_speed_mph)]
  end

  def self.vis_extremums
    [round_down(minimum(:mean_visibility_miles)), maximum(:mean_visibility_miles)]
  end

  def self.precip_extremum
    [round_down(minimum(:precipitation_inches)), maximum(:precipitation_inches)]
  end

end
