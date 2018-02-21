require 'rails_helper'

describe "As a registered user and admin" do
  describe "when I visit the weather-dashboard" do
    before(:each) do
        condition1 = create(:condition, max_temp_f: 55, date: '2/2/1993', precipitation_inches: 0.2, mean_wind_speed_mph: 4, mean_visibility_miles: 3)
        condition2 = create(:condition, max_temp_f: 65, date: '2/2/1993', precipitation_inches: 0.8, mean_wind_speed_mph: 7, mean_visibility_miles: 8)
        condition3 = create(:condition, max_temp_f: 75, date: '2/3/1993', precipitation_inches: 1.2, mean_wind_speed_mph: 13, mean_visibility_miles: 4)
        condition4 = create(:condition, max_temp_f: 85, date: '2/3/1993', precipitation_inches: 0.5, mean_wind_speed_mph: 16, mean_visibility_miles: 5)
        condition5 = create(:condition, max_temp_f: 70, date: '2/3/1993', precipitation_inches: 0.7, mean_wind_speed_mph: 22, mean_visibility_miles: 7)
        condition6 = create(:condition, max_temp_f: 70, date: '2/3/1993', precipitation_inches: 0.7, mean_wind_speed_mph: 12, mean_visibility_miles: 2)
        create_list(:trip, 5, condition_id: condition1.id)
        create_list(:trip, 12, condition_id: condition2.id)
        create_list(:trip, 13, condition_id: condition3.id)
        create_list(:trip, 20, condition_id: condition4.id)
        create_list(:trip, 32, condition_id: condition5.id)
        create_list(:trip, 45, condition_id: condition6.id)
      end
    it "shows weather analytics" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/weather-dashboard'

      expect(page).to have_content("Weather Dashboard")
      expect(page).to have_content("Ride Analytics For High Temperatures")
      expect(page).to have_content("Ride Analytics For Visibility")
      expect(page).to have_content("Ride Analytics For Max Wind Speeds")
      expect(page).to have_content("Ride Analytics For Precipitation Levels")
      expect(page).to have_content(Condition.avg_trips({max_temp_f: 50..60}))
      expect(page).to have_content(Condition.trips_extremums('max', {max_temp_f: 50..60}))
      expect(page).to have_content(Condition.trips_extremums('min', {max_temp_f: 50..60}))
      expect(page).to have_content(Condition.avg_trips({precipitation_inches: 0..0.5}))
      expect(page).to have_content(Condition.trips_extremums('max', {precipitation_inches: 0..0.5}))
      expect(page).to have_content(Condition.trips_extremums('max', {precipitation_inches: 0..0.5}))
      expect(page).to have_content(Condition.avg_trips({precipitation_inches: 0.5..1}))
      expect(page).to have_content(Condition.trips_extremums('min', {precipitation_inches: 0.5..1}))
      expect(page).to have_content(Condition.trips_extremums('min', {precipitation_inches: 0.5..1}))
      expect(page).to have_content(Condition.avg_trips({mean_wind_speed_mph: 4..8}))
      expect(page).to have_content(Condition.trips_extremums('min', {mean_wind_speed_mph: 4..8}))
      expect(page).to have_content(Condition.trips_extremums('min', {mean_wind_speed_mph: 4..8}))
      expect(page).to have_content(Condition.avg_trips({mean_wind_speed_mph: 8..12}))
      expect(page).to have_content(Condition.trips_extremums('min', {mean_wind_speed_mph: 8..12}))
      expect(page).to have_content(Condition.trips_extremums('min', {mean_wind_speed_mph: 8..12}))
      expect(page).to have_content(Condition.avg_trips({mean_visibility_miles: 0..4}))
      expect(page).to have_content(Condition.trips_extremums('min', {mean_visibility_miles: 0..4}))
      expect(page).to have_content(Condition.trips_extremums('min', {mean_visibility_miles: 0..4}))
      expect(page).to have_content(Condition.avg_trips({mean_visibility_miles: 4..8}))
      expect(page).to have_content(Condition.trips_extremums('min', {mean_visibility_miles: 4..8}))
      expect(page).to have_content(Condition.trips_extremums('min', {mean_visibility_miles: 4..8}))
    end
  end
end
