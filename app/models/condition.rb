class Condition < ApplicationRecord
  has_many :trips

  validates_presence_of :date,
                        :max_temp_f,
                        :mean_temp_f,
                        :min_temp_f,
                        :mean_humidity,
                        :mean_visibility_miles,
                        :mean_wind_speed_mph,
                        :precipitation_inches
  def month_day_converter
    date.strftime('%B %d, %Y')
  end
end
