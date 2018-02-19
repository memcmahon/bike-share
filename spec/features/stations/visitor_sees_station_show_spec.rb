require 'rails_helper'

describe "As a visitor" do
  describe "when I visit the station show page" do
    it "user sees url '/:station-name' w/ that station's name instead of :id" do
      station = create(:station, lat: 2, long:3)

      visit station_path(station.slug)

      expect(current_path).to eq("/stations/81-street")
      expect(page).to have_content("Name: 81 Street")
      expect(page).to have_content("Dock Count: 81")
      expect(page).to have_content("Lat: 2")
      expect(page).to have_content("Long: 3")
      expect(page).to have_content("City: San Francisco")
      expect(page).to have_content("Installation Date: 1991-12-12")    
    end
  end
end

