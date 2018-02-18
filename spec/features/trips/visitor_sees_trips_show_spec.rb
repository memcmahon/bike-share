require 'rails_helper'

describe "As a visitor" do
  describe "they visit trips show" do
    it "they can see the trip details" do
      condition = Condition.create!(date: )
      trip = Trip.create!(duration: 174, start_date: "8/29/2013 9:08", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "8/29/2013 9:11", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114)

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
