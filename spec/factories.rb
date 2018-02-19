FactoryBot.define do

  factory :user do
  sequence(:email) { |n| "maryDavenportNo#{n}@gmail.com"}
  sequence(:first_name) { |n| "Mary#{n}"}
  sequence(:last_name) { |n| "Davenport#{n}"}
  sequence(:password) { |n| "password#{n}"}
  role 0
  end

  factory :admin, class: User do
  sequence(:email) { |n| "maryDavenportNo#{n}@gmail.com"}
  sequence(:first_name) { |n| "Mary#{n}"}
  sequence(:last_name) { |n| "Davenport#{n}"}
  sequence(:password) { |n| "password#{n}"}
  role 1
  end

  factory :condition do
  date '10/1/1990'
  sequence(:max_temp_f) { |n| n }
  sequence(:mean_temp_f) { |n| n }
  sequence(:min_temp_f) { |n| n }
  sequence(:max_dew_point_f) { |n| n }
  sequence(:mean_dew_point_f) { |n| n }
  sequence(:max_humidity) { |n| n }
  sequence(:mean_humidity) { |n| n }
  sequence(:min_humidity) { |n| n }
  sequence(:max_sea_level_pressure_inches) { |n| n }
  sequence(:mean_sea_level_pressure_inches) { |n| n }
  sequence(:min_sea_level_pressure_inches) { |n| n }
  sequence(:max_visibility_miles) { |n| n }
  sequence(:mean_visibility_miles) { |n| n }
  sequence(:min_visibility_miles) { |n| n }
  sequence(:max_wind_speed_mph) { |n| n }
  sequence(:mean_wind_speed_mph) { |n| n }
  sequence(:max_gust_speed_mph) { |n| n }
  sequence(:precipitation_inches) { |n| n }
  sequence(:cloud_cover) { |n| n }
  sequence(:events) { |n| "#{n}" }
  sequence(:wind_dir_degrees) { |n| n }
  sequence(:zip_code) { |n| n }
  end

  factory :trip do
  sequence(:duration) { |n| n }
  start_date "10/1/1990"
  end_date "10/2/1990"
  start_station_name "Willow Creek"
  start_station_id 1
  sequence(:bike_id) { |n| n }
  end_station_name "Jumping Rabbit Creek"
  end_station_id 2
  subscription_type "Subscriber"
  zip_code 55555
  condition
  end

  factory :station do
  sequence(:name) { |n| "#{n} Street"}
  sequence(:lat) { |n| n }
  sequence(:long) { |n| n }
  sequence(:dock_count) { |n| n }
  city "San Francisco"
  installation_date "12/12/1991"
  end

  factory :status do
  sequence(:bikes_available) { |n| n }
  sequence(:docks_available) { |n| n }
  time "2013/1/29 12:13:01"
  station
  end

end
