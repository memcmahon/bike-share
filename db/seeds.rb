# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
OPTIONS = {headers: true, header_converters: :symbol }
Station.destroy_all
Trip.destroy_all
Condition.destroy_all

CSV.foreach('db/fixtures/condition.csv', OPTIONS) do |row|
  Condition.create!(date: Date.strptime(row[:date], '%m/%e/%Y'),
                    max_temp_f: row[:max_temperature_f],
                    mean_temp_f: row[:mean_temperature_f],
                    min_temp_f: row[:min_temperature_f],
                    max_dew_point_f: row[:max_dew_point_f],
                    mean_dew_point_f: row[:mean_dew_point_f],
                    max_humidity: row[:max_humidity],
                    mean_humidity: row[:mean_humidity],
                    min_humidity: row[:min_humidity],
                    max_sea_level_pressure_inches: row[:max_sea_level_pressure_inches],
                    mean_sea_level_pressure_inches: row[:max_sea_level_pressure_inches],
                    min_sea_level_pressure_inches: row[:min_sea_level_pressure_inches],
                    max_visibility_miles: row[:max_visibility_miles],
                    mean_visibility_miles: row[:mean_visibility_miles],
                    min_visibility_miles: row[:min_visibility_miles],
                    max_wind_speed_mph: row[:max_wind_speed_mph],
                    mean_wind_speed_mph: row[:mean_wind_speed_mph],
                    max_gust_speed_mph: row[:max_gust_speed_mph],
                    precipitation_inches: row[:precipitation_inches],
                    cloud_cover: row[:cloud_cover],
                    events: row[:events],
                    wind_dir_degrees: row[:wind_dir_degrees],
                    zip_code: row[:zip_code])
  puts "Created #{Condition.last}"
end

CSV.foreach('db/fixtures/station.csv', OPTIONS) do |row|
  Station.create!(name: row[:name],
    lat: row[:lat],
    long: row[:long],
    dock_count: row[:dock_count],
    city: row[:city],
    installation_date: Date.strptime(row[:installation_date], '%m/%e/%Y'))
  puts "Created #{Station.last}"
end

CSV.foreach('db/fixtures/trip.csv', OPTIONS) do |row|
  Trip.create!(duration: row[:duration],
               start_date: Date.strptime(row[:start_date], '%m/%e/%Y'),
               start_station: Station.all.shuffle[0],
               end_date: Date.strptime(row[:end_date], '%m/%e/%Y'),
               end_station: Station.all.shuffle[0],
               bike_id: row[:bike_id],
               subscription_type: row[:subscription_type],
               zip_code: row[:zip_code],
               condition: if Condition.find_by(date: Date.strptime(row[:start_date], '%m/%e/%Y'))
                            Condition.find_by(date: Date.strptime(row[:start_date], '%m/%e/%Y'))
                          else
                            Condition.all.shuffle[0]
                          end)
  puts "Created #{Trip.last}"
end
