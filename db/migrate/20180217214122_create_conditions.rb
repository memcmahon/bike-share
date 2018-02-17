class CreateConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |t|
      t.datetime :date
      t.float :max_temp_f
      t.float :mean_temp_f
      t.float :min_temp_f
      t.float :max_dew_point_f
      t.float :mean_dew_point_f
      t.float :max_humidity
      t.float :mean_humidity
      t.float :min_humidity
      t.float :max_sea_level_pressure_inches
      t.float :mean_sea_level_pressure_inches
      t.float :min_sea_level_pressure_inches
      t.float :max_visibility_miles
      t.float :mean_visibility_miles
      t.float :min_visibility_miles
      t.float :max_wind_speed_mph
      t.float :mean_wind_speed_mph
      t.float :max_gust_speed_mph
      t.float :precipitation_inches
      t.float :cloud_cover
      t.string :events
      t.float :wind_dir_degrees
      t.integer :zip_code
    end
  end
end
