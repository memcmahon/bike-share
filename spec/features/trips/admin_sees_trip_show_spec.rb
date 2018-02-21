require 'rails_helper'

describe "As an admin" do
  describe "they visit trips show" do
    before(:each) do
      @admin = create(:admin)
      @trip = create(:trip)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      visit trip_path(@trip)
    end

    it "they can see the trip details" do
      expect(page).to have_content(@trip.duration)
      expect(page).to have_content(@trip.start_date.strftime("%m/%d/%Y"))
      expect(page).to have_content(@trip.start_station_name)
      expect(page).to have_content(@trip.end_date.strftime("%m/%d/%Y"))
      expect(page).to have_content(@trip.end_station_name)
      expect(page).to have_content(@trip.bike_id)
      expect(page).to have_content(@trip.subscription_type)
      expect(page).to have_content(@trip.zip_code)
    end

    it "they can see edit and delete links" do
      expect(page).to have_link("Edit")
      expect(page).to have_link("Delete")
    end
  end
end
