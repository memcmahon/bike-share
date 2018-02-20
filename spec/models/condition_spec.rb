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
      condition1 = create(:condition, max_temp_f: 55, date: '2/2/1993', precipitation_inches: 0.2, mean_wind_speed_mph: 23, mean_visibility_miles: 10)
      condition2 = create(:condition, max_temp_f: 51, date: '2/2/1993', precipitation_inches: 0.2, mean_wind_speed_mph: 23, mean_visibility_miles: 10)
      condition3 = create(:condition, max_temp_f: 58, date: '2/3/1993', precipitation_inches: 0.2, mean_wind_speed_mph: 23, mean_visibility_miles: 10)
      condition4 = create(:condition, max_temp_f: 60, date: '2/3/1993', precipitation_inches: 0.2, mean_wind_speed_mph: 23, mean_visibility_miles: 10)
      trips_1 = create_list(:trip, 5, condition_id: condition1.id)
      trips_2 = create_list(:trip, 12, condition_id: condition2.id)
      trips_3 = create_list(:trip, 13, condition_id: condition3.id)
      trips_3 = create_list(:trip, 20, condition_id: condition4.id)
      @conditions = [condition1, condition2, condition3, condition4]
    end
    it "returns average trips per day within max temp range" do
      expect(Condition.avg_trips_max_temp(50..60)).to eq(12.0)
    end
    it "returns count of most and least trips within max temp range" do
      expect(Condition.extremum_trips_max_temp(50..60, 'DESC')).to eq(33)
      expect(Condition.extremum_trips_max_temp(50..60, 'ASC')).to eq(17)
    end
    it "returns average count of trips within precipitation range" do
      expect(Condition.avg_trips_precipitation(0..0.5)).to eq(12)
    end
    it "returns count of most and least trips within precipitation range" do
      expect(Condition.extremum_trips_precipitation(0..0.5, 'DESC')).to eq(33)
      expect(Condition.extremum_trips_precipitation(0..0.5, 'ASC')).to eq(17)
    end
    it "returns average count of trips within wind speed range" do
      expect(Condition.avg_trips_wind_speed(20..25)).to eq(12)
    end
    it "returns count of most and least trips within wind speed range" do
      expect(Condition.extremum_trips_wind_speed(20..25, 'DESC')).to eq(33)
      expect(Condition.extremum_trips_wind_speed(20..25, 'ASC')).to eq(17)
    end
  end
end
