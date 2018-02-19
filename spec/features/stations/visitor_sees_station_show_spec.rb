require 'rails_helper'

describe "As a visitor" do
  describe "when I visit the station show page" do
    it "user sees url '/:station-name' w/ that station's name instead of :id" do
      station = create(:station)

      visit station_path(station)

      expect(current_path).to eq("/stations/1street")
      expect(page).to have_content("1Street")
      expect(page).to have_content("1")
      expect(page).to have_content("San Francisco")
      expect(page).to have_content("1991-12-12")    
    end
  end
end



# As a visitor,
# When I visit the station show
# I see the url '/:station-name' with that station's name instead of :id,
# I see all attributes for that station.

 # create_table "stations", force: :cascade do |t|
 #    t.string "name"
 #    t.float "lat"
 #    t.float "long"
 #    t.integer "dock_count"
 #    t.string "city"
 #    t.date "installation_date"