require 'rails_helper'

describe "As a visitor" do
  describe "they visit trips show" do
    it "they can see the trip details" do
      trip = create(:trip)

      visit trip_path(trip)

      expect(page).to have_content(trip.duration)
      expect(page).to have_content(trip.start_date.strftime("%m/%d/%Y"))
      expect(page).to have_content(trip.start_station_name)
      expect(page).to have_content(trip.end_date.strftime("%m/%d/%Y"))
      expect(page).to have_content(trip.end_station_name)
      expect(page).to have_content(trip.bike_id)
      expect(page).to have_content(trip.subscription_type)
      expect(page).to have_content(trip.zip_code)
    end
  end
end
