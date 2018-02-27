# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
OPTIONS = {headers: true, header_converters: :symbol }
OrderAccessory.destroy_all
Station.destroy_all
Trip.destroy_all
Condition.destroy_all
Accessory.destroy_all

Accessory.create!(name: "Headlight", description: "See things!", price: 1200, status: 0)
Accessory.create!(name: "Taillight", description: "Let people see you!", price: 1300, status: 0)
Accessory.create!(name: "Wheel lights", description: "Get fancy!", price: 1400, status: 0)
Accessory.create!(name: "Rear rack", description: "Get ready to hold things!", price: 1200, status: 0)
Accessory.create!(name: "Basket", description: "For Toto!", price: 1500, status: 0)
Accessory.create!(name: "Panniers", description: "Hold things!", price: 1600, status: 0)
Accessory.create!(name: "Cup holder", description: "Drink things!", price: 1700, status: 0)
Accessory.create!(name: "Insulated Bike Bag", description: "Keep things cold!", price: 1800, status: 0)
Accessory.create!(name: "Tubes", description: "Air pressure!", price: 1900, status: 0)
Accessory.create!(name: "Tires", description: "Grip things!", price: 2000, status: 0)
Accessory.create!(name: "Spokes", description: "Structure!", price: 2100, status: 0)
Accessory.create!(name: "Hanle wrap", description: "Be unique!", price: 2200, status: 0)


CSV.foreach('db/fixtures/weather.csv', OPTIONS) do |row|
  Condition.create!(date: Date.strptime(row[:date], '%m/%e/%Y'),
                    max_temp_f: row[:max_temperature_f],
                    mean_temp_f: row[:mean_temperature_f],
                    min_temp_f: row[:min_temperature_f],
                    mean_humidity: row[:mean_humidity],
                    mean_visibility_miles: row[:mean_visibility_miles],
                    mean_wind_speed_mph: row[:mean_wind_speed_mph],
                    precipitation_inches: row[:precipitation_inches],
                    zip_code: row[:zip_code])
  puts "Created #{Condition.last}"
end

CSV.foreach('db/fixtures/station.csv', OPTIONS) do |row|
  Station.create!(id: row[:id],
    name: row[:name],
    dock_count: row[:dock_count],
    city: row[:city],
    installation_date: Date.strptime(row[:installation_date], '%m/%e/%Y'))
  puts "Created #{Station.last}"
end

CSV.foreach('db/fixtures/trip.csv', OPTIONS) do |row|
  Trip.create!(id: row[:id],
               duration: row[:duration],
               start_date: Date.strptime(row[:start_date], '%m/%e/%Y'),
               start_station: Station.all.shuffle[0],
               end_date: Date.strptime(row[:end_date], '%m/%e/%Y'),
               end_station: Station.all.shuffle[0],
               bike_id: row[:bike_id],
               subscription_type: row[:subscription_type],
               zip_code: if row[:zip_code] && row[:zip_code].length < 6
                            row[:zip_code]
                          end,
               condition: if Condition.find_by(date: Date.strptime(row[:start_date], '%m/%e/%Y'))
                            Condition.find_by(date: Date.strptime(row[:start_date], '%m/%e/%Y'))
                          else
                            Condition.all.shuffle[0]
                          end)
  puts "Created #{Trip.last}"
end
