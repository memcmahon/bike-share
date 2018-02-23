require 'rails_helper'

describe "As an admin" do
  before(:each) do
    @station = create(:station)
    @condition = create(:condition)
    @trips = create_list(:trip, 5, start_station: @station, end_station: @station)
    @admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end

  describe "They visit the trip show" do
    it "they can edit that trip" do
      visit trip_path(@trips[0])

      click_on("Edit")

      fill_in("trip[duration]", with: "300")
      fill_in("trip[start_date]", with: "02/12/1232")
      select(@station.name, from: "trip[start_station_id]")
      fill_in("trip[end_date]", with: "02/12/1232")
      select(@station.name, from: "trip[end_station_id]")
      fill_in("trip[bike_id]", with: "13")
      fill_in("trip[subscription_type]", with: "Customer")
      fill_in("trip[zip_code]", with: "52556")
      click_on("Update Trip")

      expect(current_path).to eq(trip_path(@trips[0]))
    end
  end
end

describe "as a registered user" do
  before(:each) do
    @station = create(:station)
    @trips = create_list(:trip, 5, start_station: @station, end_station: @station)
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe "they visit edit_trip_path" do
    it "they see an error message" do
      visit edit_admin_trip_path(@trips[0])

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
