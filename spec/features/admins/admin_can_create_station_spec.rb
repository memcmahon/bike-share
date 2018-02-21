require 'rails_helper'

describe "As an admin" do
  describe "they can create a station" do
    it "they create the station" do
      admin = create(:admin)
  
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_station_path

      expect(page).to have_content("Create A Station")
    
      fill_in 'station[name]', with: "Denver Bike"
      fill_in 'station[lat]', with: "11"
      fill_in 'station[long]', with: "22"
      fill_in 'station[dock_count]', with: 20
      fill_in 'station[city]', with: "Miami"
      fill_in 'station[installation_date]', with: Date.new(2013,12,12)
 
      click_on "Create Station"

      expect(page).to have_content("Station Details")
      expect(page).to have_content("Denver Bike")
      expect(page).to have_content("Miami")
      expect(page).to have_content("2013-12-12")
    
    end
  end
end

