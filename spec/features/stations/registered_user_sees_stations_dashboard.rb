require 'rails_helper'

describe "As a registered user and admin" do
  describe "when I visit the stations-dashboard" do
    it "I see station analytics" do

      visit '/stations-dashboard'

      expect(page).to have_content("Total count of stations: 84")
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