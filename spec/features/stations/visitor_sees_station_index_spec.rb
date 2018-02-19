require 'rails_helper'

# As a visitor,
# When I visit the stations index,
# I see all stations (name, dock count, city, installation date)

describe "As a visitor" do
  describe "they can visit stations index" do
    it "they see all stations info" do
      create_list(:station, 84)

      visit stations_path

      expect(page).to have_content("San Jose Diridon Caltrain Station")
      expect(page).to have_content("27")
      expect(page).to have_content("San Jose")
      expect(page).to have_content("8/6/2013")
      expect(Station.all.count).to eq(72)
    
    end
  end
end


