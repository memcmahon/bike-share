require 'rails_helper'

describe "As a visitor" do
  describe "they visit /trips-dashboard" do
    it "They are redirected" do
      visit '/trips-dashboard'

      expect(page).to have_content("Please register or log in to visit this page")
    end
  end
end

describe "As a user" do
  describe "they visit /trips-dashboard" do
    before(:each) do
      @user = create(:user)
      @condition = create(:condition)
      @trip_1 = Trip.create!(duration: 200, start_date: Date.strptime("10/3/2017", "%m/%e/%Y"), start_station_name: "DBC", start_station_id: 1, end_date: Date.strptime("10/3/2017", "%m/%e/%Y"), end_station_name: "Diebolt", end_station_id: 2, bike_id: 13, subscription_type: "Subscriber", zip_code: 55555, condition: @condition)
      @trip_2 = Trip.create!(duration: 250, start_date: Date.strptime("10/3/2017", "%m/%e/%Y"), start_station_name: "DBC", start_station_id: 1, end_date: Date.strptime("10/3/2017", "%m/%e/%Y"), end_station_name: "Diebolt", end_station_id: 2, bike_id: 13, subscription_type: "Subscriber", zip_code: 55555, condition: @condition)
      @trip_3 = Trip.create!(duration: 300, start_date: Date.strptime("10/3/2017", "%m/%e/%Y"), start_station_name: "DBC", start_station_id: 1, end_date: Date.strptime("10/3/2017", "%m/%e/%Y"), end_station_name: "Diebolt", end_station_id: 2, bike_id: 13, subscription_type: "Subscriber", zip_code: 55555, condition: @condition)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:user)
      visit "/trips-dashboard"
    end

    it "they see the average duration of a ride" do
      expect(page).to have_content("Average Duration: 250")
    end
  end
end

#
# I see the Average duration of a ride,
# I see the Longest ride,
# I see the Shortest ride,
# I see the Station with the most rides as a starting place,
# I see the Station with the most rides as an ending place,
# I see Month by Month breakdown of number of rides with subtotals for each year,
# I see the Most ridden bike with total number of rides for that bike,
# I see the Least ridden bike with total number of rides for that bike,
# I see the User subscription type breakout with both count and percentage,
# I see the Single date with the highest number of trips with a count of those trips,
# I see the Single date with the lowest number of trips with a count of those trips.
