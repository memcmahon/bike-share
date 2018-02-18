require 'rails_helper'

describe "As a visitor" do
  describe "they visit trips show" do
    it "they can see the trip details" do
      condition = create(:condition)
      trip = create(:trip, condition: condition)

      visit trip_path(trip)

      expect(page).to have_content(trip.duration)
      expect(page).to have_content(trip.start_date)
      expect(page).to have_content(trip.start_station_name)
      expect(page).to have_content(trip.end_date)
      expect(page).to have_content(trip.end_station_name)
      expect(page).to have_content(trip.bike_id)
      expect(page).to have_content(trip.subscription_type)
      expect(page).to have_content(trip.zip_code)
    end
  end
end
# As a visitor,
# When I visit the trips index,
# I see the first 30 trips (duration, start date, start station, end date, end station, bike id, subscription type, zip code),
# I also see a button to see more pages of trips,
#
# When I visit a second page, there should be buttons to move both forward and backward in time.
#
# ** All Attributes must be present **
