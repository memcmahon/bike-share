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
      @condition2 = create(:condition, max_temp_f: 51, date: '2/4/1993', precipitation_inches: 0.3, mean_wind_speed_mph: 20, mean_visibility_miles: 11)
      @condition3 = create(:condition, max_temp_f: 58, date: '2/3/1993', precipitation_inches: 0.4, mean_wind_speed_mph: 22, mean_visibility_miles: 11)
      @condition4 = create(:condition, max_temp_f: 60, date: '2/5/1993', precipitation_inches: 0.1, mean_wind_speed_mph: 24, mean_visibility_miles: 12)
      create_list(:trip, 5, condition_id: @condition1.id, start_station_id: @station_1.id, end_station_id: @station_1.id)
      create_list(:trip, 12, condition_id: @condition2.id, start_station_id: @station_1.id, end_station_id: @station_1.id)
      create_list(:trip, 13, condition_id: @condition3.id, start_station_id: @station_1.id, end_station_id: @station_1.id)
      create_list(:trip, 20, condition_id: @condition4.id, start_station_id: @station_1.id, end_station_id: @station_1.id)
    end
    describe "#trip_counts" do
      it "returns count of trips per day within a range" do
        expect(Condition.trip_counts({max_temp_f: 50..60})).to eq([20, 13, 12, 5])
        expect(Condition.trip_counts({mean_wind_speed_mph: 20..24})).to eq([20, 13, 12, 5])
        expect(Condition.trip_counts({precipitation_inches: 0..0.5})).to eq([20, 13, 12, 5])
        expect(Condition.trip_counts({mean_visibility_miles: 8..12})).to eq([20, 13, 12, 5])
      end
    end
    describe "#avg_trips" do
      it "returns average trips per day within  range" do
        expect(Condition.avg_trips({max_temp_f: 50..60})).to eq(12.0)
        expect(Condition.avg_trips({precipitation_inches: 0..0.5})).to eq(12)
        expect(Condition.avg_trips({mean_wind_speed_mph: 20..24})).to eq(12)
        expect(Condition.avg_trips({mean_visibility_miles: 8..12})).to eq(12)
      end
    end
    describe "#trips_extremums" do
      it "returns count of most and least trips within range" do
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
    describe "#temp_extremums" do
      it "returns an array with the smallest and largest temp" do
        expect(Condition.temp_extremums).to eq([50, 60])
      end
    end
    describe "#wind_speed_extremums" do
      it "returns an array with the smallest and largest wind speed" do
        expect(Condition.wind_speed_extremums).to eq([20, 24])
      end
    end
    describe "#vis_extremums" do
      it "returns an array of the smalles and largest visibility levels" do
        expect(Condition.vis_extremums).to eq([10, 12])
      end
    end
    describe "#precip_extremum" do
      it "returns an array of the smallest and largest precipitation levels" do
        expect(Condition.precip_extremum).to eq([0, 0.4])
      end
    end
    describe "#ranges" do
      it "returns and array of ranges" do
        expect(Condition.ranges(10, 50, 10)).to eq([10..20, 20..30, 30..40, 40..50, 50..60])
      end
    end
    describe "#set_ranges" do
      it "returns an array of arrays with numbers being incremented as pairs" do
        expect(Condition.set_ranges(10, 30, 10)).to eq([[10, 20], [20, 30], [30, 40]])
      end
    end
    describe "#round_down" do
      it "rounds numbers down to the nearest whole 10th" do
        expect(Condition.round_down(12.3)).to eq(10)
        expect(Condition.round_down(23.34)).to eq(20)
      end
    end
  end
end
