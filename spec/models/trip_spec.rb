require 'rails_helper'

describe Trip, type: :model do
  describe "validations" do
    it {should validate_presence_of(:duration)}
    it {should validate_presence_of(:start_date)}
    it {should validate_presence_of(:start_station)}
    it {should validate_presence_of(:end_date)}
    it {should validate_presence_of(:end_station)}
    it {should validate_presence_of(:bike_id)}
    it {should validate_presence_of(:subscription_type)}
  end
  describe "relationships" do
    it {should belong_to(:condition)}
  end

  describe "analytics" do
    before(:each) do
      @user = create(:user)
      @station_1 = create(:station)
      @station_2 = create(:station)
      @station_3 = create(:station)
      @condition_1 = create(:condition, date: Date.strptime("10/3/2017", "%m/%e/%Y"))
      @condition_2 = create(:condition, date: Date.strptime("11/3/2016", "%m/%e/%Y"))
      @trip_1 = Trip.create!(duration: 200, start_date: Date.strptime("10/3/2017", "%m/%e/%Y"), start_station: @station_1, end_date: Date.strptime("10/3/2017", "%m/%e/%Y"), end_station: @station_2, bike_id: 14, subscription_type: "Customer", zip_code: 55555, condition: @condition_1)
      @trip_2 = Trip.create!(duration: 250, start_date: Date.strptime("10/3/2017", "%m/%e/%Y"), start_station: @station_2, end_date: Date.strptime("10/3/2017", "%m/%e/%Y"), end_station: @station_2, bike_id: 13, subscription_type: "Subscriber", zip_code: 55555, condition: @condition_1)
      @trip_3 = Trip.create!(duration: 300, start_date: Date.strptime("11/3/2016", "%m/%e/%Y"), start_station: @station_2, end_date: Date.strptime("11/3/2016", "%m/%e/%Y"), end_station: @station_3, bike_id: 13, subscription_type: "Subscriber", zip_code: 55555, condition: @condition_2)
    end

    it "calculates average duration of a ride" do
      expect(Trip.average_duration).to eq(250)
    end

    it "returns longest and shortest rides" do
      expect(Trip.sort_by_duration.last).to eq(@trip_3)
      expect(Trip.sort_by_duration.first).to eq(@trip_1)
    end

    it "returns stations with most and fewest started rides" do
      expect(Trip.station_with_most_starts).to eq(@station_1.name)
      expect(Trip.station_with_most_ends).to eq(@station_2.name)
    end

    it "returns a breakdown of rides by month and by year" do
      expect(Trip.rides_by_month.first.last).to eq(1)
      expect(Trip.rides_by_year.first.last).to eq(1)
    end

    it "returns the most and least ridden bike" do
      expect(Trip.bike_with_most_rides).to eq([13, 2])
      expect(Trip.bike_with_least_rides).to eq([14, 1])
    end

    it "returns the date with highest and lowest number of rides" do
      expect(Trip.date_with_most_rides.first.strftime("%m/%d/%Y")).to eq("10/03/2017")
      expect(Trip.date_with_fewest_rides.first.strftime("%m/%d/%Y")).to eq("11/03/2016")
    end

    it "returns the conditions for the dates with highest and lowest rides" do
      expect(Trip.weather_for_date_with_most_rides.max_temp_f).to eq(@condition_1.max_temp_f)
      expect(Trip.weather_for_date_with_fewest_rides.max_temp_f).to eq(@condition_2.max_temp_f)
    end
  end
end
