require 'rails_helper'

describe "As an admin" do
  before(:each) do
    @trips = create_list(:trip, 5)
    @admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end

  describe "They visit the trip show" do
    it "they can edit that trip" do
      visit trip_path(@trips[0])

      click_on("Edit")

      fill_in("trip[duration]", with: 1331)
      fill_in("trip[start_date]", with: "01/13/1988")
      fill_in("trip[start_station_name]", with: "DBC")
      fill_in("trip[start_station_id]", with: 1)
      fill_in("trip[end_date]", with: "01/13/1988")
      fill_in("trip[end_station_name]", with: "Diebolt")
      fill_in("trip[end_station_id]", with: 2)
      fill_in("trip[bike_id]", with: 13)
      fill_in("trip[subscription_type]", with: "customer")
      fill_in("trip[zip_code]", with: 55555)
      select("01/13/1988", from: "condition")
      click_on("Update Trip")

      expect(current_path).to eq(trip_path(@trips[0]))
    end
  end
end

describe "as a registered user" do
  before(:each) do
    @trips = create_list(:trip, 5)
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
