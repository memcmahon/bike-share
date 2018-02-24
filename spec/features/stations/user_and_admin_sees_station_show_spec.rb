require 'rails_helper'

describe "as a user or admin" do
  describe "when I visit a station path" do
    before(:each) do
      @user = create(:user)
      @station_1 = create(:station, name: "Ali")
      @station_2 = create(:station, name: "Ilana")
      @station_3 = create(:station, name: "Sal")
      @condition_1 = create(:condition, date: Date.strptime("10/3/2017", "%m/%e/%Y"))
      @condition_2 = create(:condition, date: Date.strptime("11/3/2016", "%m/%e/%Y"))
      @trip_1 = Trip.create!(duration: 200, start_date: Date.strptime("10/3/2017", "%m/%e/%Y"), start_station: @station_1, end_date: Date.strptime("10/3/2017", "%m/%e/%Y"), end_station: @station_2, bike_id: 14, subscription_type: "Customer", zip_code: 52556, condition: @condition_1)
      @trip_2 = Trip.create!(duration: 250, start_date: Date.strptime("10/3/2017", "%m/%e/%Y"), start_station: @station_1, end_date: Date.strptime("10/3/2017", "%m/%e/%Y"), end_station: @station_1, bike_id: 13, subscription_type: "Subscriber", zip_code: 55555, condition: @condition_1)
      @trip_2 = Trip.create!(duration: 250, start_date: Date.strptime("10/6/2017", "%m/%e/%Y"), start_station: @station_1, end_date: Date.strptime("10/3/2017", "%m/%e/%Y"), end_station: @station_2, bike_id: 13, subscription_type: "Subscriber", zip_code: 52556, condition: @condition_1)
      @trip_3 = Trip.create!(duration: 300, start_date: Date.strptime("11/3/2016", "%m/%e/%Y"), start_station: @station_2, end_date: Date.strptime("11/3/2016", "%m/%e/%Y"), end_station: @station_3, bike_id: 13, subscription_type: "Subscriber", zip_code: 55555, condition: @condition_2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "I see the number of rides started at this station" do
      visit station_path(@station_1.slug)

      expect(page).to have_content("Trips started here: 3")
    end

    it "I see the number of rides ended at this station" do
      visit station_path(@station_3.slug)

      expect(page).to have_content("Trips ended here: 1")
    end

    it "I see the most frequent destination station for rides started at this station" do
      visit station_path(@station_1.slug)

      expect(page).to have_content("Most frequent destination from this station: #{@station_2.name}")
    end

    it "I see the most frequent origination station for rides ended at this station" do
      visit station_path(@station_2.slug)

      expect(page).to have_content("Most frequent origination to this station: #{@station_1.name}")
    end

    it "I see the date with the highest number of rides started at this station" do
      visit station_path(@station_1.slug)

      expect(page).to have_content("Date with most rides started at this station: 10/03/2017")
    end

    it "I see the most frequent zip code for trips starting at this station" do
      visit station_path(@station_1.slug)

      expect(page).to have_content("Most frequent zip code for trips starting here: 52556")
    end

    it "I see the most frequent bike_id starting from this station" do
      visit station_path(@station_1.slug)

      expect(page).to have_content("Most frequent bike id for trips starting here: 13")
    end
  end
end
