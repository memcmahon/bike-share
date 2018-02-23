require 'rails_helper'

describe "As an admin" do
  before(:each) do
    @admin = create(:admin)
    @station = create(:station)
    @condition = create(:condition, date: "02/12/1232")
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

      fill_in("trip[duration]", with: "300")
      fill_in("trip[start_date]", with: "02/12/1232")
      select(@station.name, from: "trip[start_station_id]")
      fill_in("trip[end_date]", with: "02/12/1232")
      select(@station.name, from: "trip[end_station_id]")
      fill_in("trip[bike_id]", with: "13")
      fill_in("trip[subscription_type]", with: "Customer")
      fill_in("trip[zip_code]", with: "52556")

      click_on("Create Trip")

      expect(Trip.count).to eq(1)
      expect(page).to have_content("Success - you have created a trip.")
      expect(Condition.last.date).to eq(Trip.last.start_date)
    end
  end
end
