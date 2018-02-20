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
      @trip_1 = Trip.create!(duration: 200, start_date: Date.strptime("10/3/2017", "%m/%e/%Y"), start_station_name: "Little Man", start_station_id: 3, end_date: Date.strptime("10/3/2017", "%m/%e/%Y"), end_station_name: "Diebolt", end_station_id: 2, bike_id: 14, subscription_type: "Customer", zip_code: 55555, condition: @condition)
      @trip_2 = Trip.create!(duration: 250, start_date: Date.strptime("10/3/2017", "%m/%e/%Y"), start_station_name: "DBC", start_station_id: 1, end_date: Date.strptime("10/3/2017", "%m/%e/%Y"), end_station_name: "Diebolt", end_station_id: 2, bike_id: 13, subscription_type: "Subscriber", zip_code: 55555, condition: @condition)
      @trip_3 = Trip.create!(duration: 300, start_date: Date.strptime("11/3/2016", "%m/%e/%Y"), start_station_name: "DBC", start_station_id: 1, end_date: Date.strptime("11/3/2016", "%m/%e/%Y"), end_station_name: "Little Man", end_station_id: 3, bike_id: 13, subscription_type: "Subscriber", zip_code: 55555, condition: @condition)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:user)
      visit "/trips-dashboard"
    end

    it "they see the average duration of a ride" do
      expect(page).to have_content("Average Duration: 250")
    end

    it "they see the longest and shortest rides" do
      expect(page).to have_content("Longest Ride: 300")
      expect(page).to have_content("Shortest Ride: 200")
    end

    it "they see the stations with the most starting and most ending rides" do
      expect(page).to have_content("Station with most started rides: DBC")
      expect(page).to have_content("Station with most ended rides: Diebolt")
    end

    it "they see a breakdown of rides by month and year" do
      expect(page).to have_content("October: 2")
      expect(page).to have_content("November: 1")
      expect(page).to have_content("2017: 2")
      expect(page).to have_content("2016: 1")
    end

    it "they see the most and least ridden bike" do
      expect(page).to have_content("Most ridden bike: 13 - 2 rides")
      expect(page).to have_content("Least ridden bike: 14 - 1 rides")
    end

    it "they see a breakdown of rides by subscription type" do
      expect(page).to have_content("Customer: 1 - 33.33%")
      expect(page).to have_content("Subscriber: 2 - 66.67%")
    end

    it "they see the date with highest and lowest number of rides" do
      expect(page).to have_content("Date with most rides: 10/03/2017 - 2 ride(s)")
      expect(page).to have_content("Date with fewest rides: 11/03/2016 - 1 ride(s)")
    end
  end
end
