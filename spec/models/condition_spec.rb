require 'rails_helper'

describe Condition, type: :model do
  describe "validations" do
    it {should validate_presence_of(:date)}
  end

  describe "relationships" do
    it {should have_many(:trips)}
  end

  describe "instance methods" do
    it "converts datetime to month and day" do
      condition = create(:condition, date: '12/12/2017')

      expect(condition.month_day_converter).to eq('December 12, 2017')
    end
  end

  describe 'class methods' do
    before(:each) do
      @station_1 = create(:station)
      @condition1 = create(:condition, max_temp_f: 55, date: '2/2/1993', precipitation_inches: 0.2, mean_wind_speed_mph: 23, mean_visibility_miles: 10)
      @condition2 = create(:condition, max_temp_f: 51, date: '2/4/1993', precipitation_inches: 0.2, mean_wind_speed_mph: 23, mean_visibility_miles: 10)
      @condition3 = create(:condition, max_temp_f: 58, date: '2/3/1993', precipitation_inches: 0.2, mean_wind_speed_mph: 23, mean_visibility_miles: 10)
      @condition4 = create(:condition, max_temp_f: 60, date: '2/5/1993', precipitation_inches: 0.2, mean_wind_speed_mph: 23, mean_visibility_miles: 10)
      create_list(:trip, 5, start_station: @station_1, end_station: @station_1, condition_id: @condition1.id)
      create_list(:trip, 12, start_station: @station_1, end_station: @station_1, condition_id: @condition2.id)
      create_list(:trip, 13, start_station: @station_1, end_station: @station_1, condition_id: @condition3.id)
      create_list(:trip, 20, start_station: @station_1, end_station: @station_1, condition_id: @condition4.id)
    end
    it "returns count of trips per day within a range" do
      expect(Condition.trip_counts({max_temp_f: 50..60})).to eq([20, 13, 12, 5])
      expect(Condition.trip_counts({mean_wind_speed_mph: 20..24})).to eq([20, 13, 12, 5])
      expect(Condition.trip_counts({precipitation_inches: 0..0.5})).to eq([20, 13, 12, 5])
      expect(Condition.trip_counts({mean_visibility_miles: 8..12})).to eq([20, 13, 12, 5])
    end
    it "returns average trips per day within  range" do
      expect(Condition.avg_trips({max_temp_f: 50..60})).to eq(12.0)
      expect(Condition.avg_trips({precipitation_inches: 0..0.5})).to eq(12)
      expect(Condition.avg_trips({mean_wind_speed_mph: 20..24})).to eq(12)
      expect(Condition.avg_trips({mean_visibility_miles: 8..12})).to eq(12)
    end
    it "returns count of most and least trips within max temp range" do
      expect(Condition.trips_extremums('max', {max_temp_f: 50..60})).to eq(20)
      expect(Condition.trips_extremums('min', {max_temp_f: 50..60})).to eq(5)
      expect(Condition.trips_extremums('max', {mean_wind_speed_mph: 20..24})).to eq(20)
      expect(Condition.trips_extremums('min', {mean_wind_speed_mph: 20..24})).to eq(5)
      expect(Condition.trips_extremums('max', {mean_visibility_miles: 8..12})).to eq(20)
      expect(Condition.trips_extremums('min', {mean_visibility_miles: 8..12})).to eq(5)
      expect(Condition.trips_extremums('max', {precipitation_inches: 0..0.5})).to eq(20)
      expect(Condition.trips_extremums('min', {precipitation_inches: 0..0.5})).to eq(5)
    end
  end
end
