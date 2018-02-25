require 'rails_helper'

describe "As an admin" do
  describe "they can edit a station" do
    it "they edit the station" do
      admin = create(:admin)
      station = create(:station)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit station_path(station.slug)

      expect(page).to have_content("Station Details")
      expect(page).to have_content(station.name)
      expect(page).to have_content("City: San Francisco")
      expect(page).to have_content("12/12/1991")

      click_on "edit"

      expect(current_path).to eq(edit_station_path(station.slug))
      expect(page).to have_content("Edit Station")

      fill_in 'station[name]', with: "Denver Bike"
      fill_in 'station[dock_count]', with: 20
      fill_in 'station[city]', with: "Miami"
      fill_in 'station[installation_date]', with: Date.new(2013,12,12)

      click_on "Update Station"

      expect(page).to have_content("Denver Bike")
      expect(page).to have_content("Miami")
      expect(page).to have_content("12/12/2013")
      expect(page).to_not have_content("City: San Francisco")
      expect(page).to_not have_content("12/12/1991")

    end
  end
end
