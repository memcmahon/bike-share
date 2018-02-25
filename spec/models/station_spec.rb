require "rails_helper"

describe Station, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:dock_count)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:installation_date)}
  end

  describe "analytics" do
    before(:each) do
      @user = create(:user)
      @station_1 = create(:station, name: "Ali")
      @station_2 = create(:station, name: "Ilana")
      @station_3 = create(:station, name: "Sal")
      @condition_1 = create(:condition, date: Date.strptime("10/3/2017", "%m/%e/%Y"))
      @condition_2 = create(:condition, date: Date.strptime("11/3/2016", "%m/%e/%Y"))
      @trip_1 = Trip.create!(duration: 200, start_date: Date.strptime("10/3/2017", "%m/%e/%Y"), start_station: @station_1, end_date: Date.strptime("10/3/2017", "%m/%e/%Y"), end_station: @station_2, bike_id: 14, subscription_type: "Customer", zip_code: 52556, condition: @condition_1)
      @trip_2 = Trip.create!(duration: 250, start_date: Date.strptime("10/3/2017", "%m/%e/%Y"), start_station: @station_1, end_date: Date.strptime("10/3/2017", "%m/%e/%Y"), end_station: @station_1, bike_id: 13, subscription_type: "Subscriber", zip_code: 55555, condition: @condition_1)
      @trip_3 = Trip.create!(duration: 250, start_date: Date.strptime("10/6/2017", "%m/%e/%Y"), start_station: @station_1, end_date: Date.strptime("10/3/2017", "%m/%e/%Y"), end_station: @station_2, bike_id: 13, subscription_type: "Subscriber", zip_code: 52556, condition: @condition_1)
      @trip_4 = Trip.create!(duration: 300, start_date: Date.strptime("11/3/2016", "%m/%e/%Y"), start_station: @station_2, end_date: Date.strptime("11/3/2016", "%m/%e/%Y"), end_station: @station_3, bike_id: 13, subscription_type: "Subscriber", zip_code: 55555, condition: @condition_2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "#most_frequent_destination" do
      expect(@station_1.most_frequent_destination).to eq(@station_2.name)
    end

    it "#most_frequent_origination" do
      expect(@station_1.most_frequent_origination).to eq(@station_1.name)
    end

    it "#date_with_most_rides_started" do
      expect(@station_1.date_with_most_rides_started).to eq("10/03/2017")
    end

    it "#most_frequent_zip_code" do
      expect(@station_1.most_frequent_zip_code).to eq(52556)
    end

    it "#most_frequent_bike" do
      expect(@station_1.most_frequent_bike).to eq(13)
    end
  end
end
