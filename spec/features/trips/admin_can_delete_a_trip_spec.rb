require 'rails_helper'

describe "As an admin" do
  before(:each) do
    @trips = create_list(:trip, 5)
    @admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end

  describe "They visit trip dashboard" do
    it "they can delete a trip" do
      visit trips_path

      click_on("Delete", match: :first)

      expect(current_path).to eq(trips_path)
      expect(page).to_not have_content(@trips[0].duration)
    end
  end

  describe "They visit trip show" do
    it "they can delete a trip" do
      visit trip_path(@trips[0])

      click_on("Delete")

      expect(current_path).to eq(trips_path)
      expect(page).to_not have_content(@trips[0].duration)
    end
  end
end
