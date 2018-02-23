require 'rails_helper'

describe "As an admin" do
  before(:each) do
    @admin = create(:admin)
    @station = create(:station)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end

  describe "I visit trip index" do
    it "I see a working button to create a new trip" do
      visit trips_path

      click_link("New Trip")

      expect(current_path).to eq(new_admin_trip_path)
    end
  end

  describe "When I visit new admin trip" do
    it "I can create a trip" do
      visit new_admin_trip_path

      fill_in("duration", with: "300")
      fill_in("start_date", with: "2-22-2017")
      select(@station.name, from: "start_station")
      fill_in("end_date", with: "2-22-2017")
      select(@station.name, from: "end_station")
      fill_in("bike_id", with: "13")
      fill_in("subscription_type", with: "Customer")
      fill_in("zip_code", with: "52556")

      expect(current_path).to eq(trip_path(Trip.last))
      expect(page).to have_content("Success - you have created a trip.")
      expect(Condition.last.date).to eq(Trip.last.start_date)
    end
  end
end
