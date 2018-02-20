require 'rails_helper'

describe "As a registered user and admin" do
  describe "when I visit the stations-dashboard" do
    it "I see station analytics" do
      first = create(:station, name: "1st")
      second = create(:station, name: "2st")
      third = create(:station, name: "3st")
      forth = create(:station, name: "4st")
      create(:status, bikes_available: 5, docks_available: 22, station_id: first.id)
      create(:status, bikes_available: 2, docks_available: 25, station_id: second.id)
      create(:status, bikes_available: 10, docks_available: 17, station_id: third.id)
      create(:status, bikes_available: 7, docks_available: 20, station_id: forth.id)
      require 'pry'; binding.pry
      visit '/stations-dashboard'

      expect(page).to have_content("Total count of stations: 84")
      expect(page).to have_content("Average bikes available: 42")
      expect(page).to have_content("Most bikes available at a station: ")
    end
  end
end




# As a registered user and admin,
# When I visit '/stations-dashboard',
# I see the Total count of stations,
# I see the Average bikes available per station (based on docks),
# I see the Most bikes available at a station (based on docks),
# I see the Station(s) where the most bikes are available (based on docks),
# I see the Fewest bikes available at a station (based on docks),
# I see the Station(s) where the fewest bikes are available (based on docks),
# I see the Most recently installed station,
# I also see the Oldest station