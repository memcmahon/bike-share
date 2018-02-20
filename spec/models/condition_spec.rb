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
      @condition1 = create(:condition, max_temp_f: 55, date: '2/2/1993', precipitation_inches: 0.2, mean_wind_speed_mph: 23, mean_visibility_miles: 10)
      @condition2 = create(:condition, max_temp_f: 51, date: '2/2/1993', precipitation_inches: 0.2, mean_wind_speed_mph: 23, mean_visibility_miles: 10)
      @condition3 = create(:condition, max_temp_f: 58, date: '2/3/1993', precipitation_inches: 0.2, mean_wind_speed_mph: 23, mean_visibility_miles: 10)
      @condition4 = create(:condition, max_temp_f: 60, date: '2/3/1993', precipitation_inches: 0.2, mean_wind_speed_mph: 23, mean_visibility_miles: 10)
      @condition5 = create(:condition, max_temp_f: 30, date: '10/2/1993', precipitation_inches: 1.2, mean_wind_speed_mph: 33, mean_visibility_miles: 19)
      create_list(:trip, 5, condition_id: @condition1.id)
      create_list(:trip, 12, condition_id: @condition2.id)
      create_list(:trip, 13, condition_id: @condition3.id)
      create_list(:trip, 20, condition_id: @condition4.id)
    end
    it "returns conditions joined on max temp range" do
      expect(Condition.trips_with_max_temp(50..60).count).to eq(50)
      expect(Condition.trips_with_max_temp(50..60)).to_not include(@condition5)
    end
    it "returns average trips per day within max temp range" do
      expect(Condition.avg_trips_max_temp(50..60)).to eq(12.0)
    end
    it "returns count of most and least trips within max temp range" do
      expect(Condition.extremum_trips_max_temp(50..60, 'DESC')).to eq(33)
      expect(Condition.extremum_trips_max_temp(50..60, 'ASC')).to eq(17)
    end
    it "returns conditions joined on precipitation range" do
      expect(Condition.trips_with_precipitation(0..0.5).count).to eq(50)
      expect(Condition.trips_with_precipitation(0..0.5)).to_not include(@condition5)
    end
    it "returns average count of trips within precipitation range" do
      expect(Condition.avg_trips_precipitation(0..0.5)).to eq(12)
    end
    it "returns count of most and least trips within precipitation range" do
      expect(Condition.extremum_trips_precipitation(0..0.5, 'DESC')).to eq(33)
      expect(Condition.extremum_trips_precipitation(0..0.5, 'ASC')).to eq(17)
    end
    it "returns conditions joined on wind speed range" do
      expect(Condition.trips_wind_speed(20..25).count).to eq(50)
      expect(Condition.trips_wind_speed(20..25)).to_not include(@condition5)
    end
    it "returns average count of trips within wind speed range" do
      expect(Condition.avg_trips_wind_speed(20..25)).to eq(12)
    end
    it "returns count of most and least trips within wind speed range" do
      expect(Condition.extremum_trips_wind_speed(20..25, 'DESC')).to eq(33)
      expect(Condition.extremum_trips_wind_speed(20..25, 'ASC')).to eq(17)
    end
    it "returns conditions joined on visibility range" do
      expect(Condition.trips_visibility(5..10).count).to eq(50)
      expect(Condition.trips_visibility(5..10)).to_not include(@condition5)
    end
    it "returns average count of trips within visibility range" do
      expect(Condition.avg_trips_visibility(5..10)).to eq(12)
    end
    it "returns count of most and least trips within visibility range" do
      expect(Condition.extremum_trips_visibility(5..10, 'DESC')).to eq(33)
      expect(Condition.extremum_trips_visibility(5..10, 'ASC')).to eq(17)
    end
  end
end
