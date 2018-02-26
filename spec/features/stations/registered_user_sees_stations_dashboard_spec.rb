require 'rails_helper'

describe "As a registered user and admin" do
  describe "when I visit the stations-dashboard" do
    it "I see station analytics" do
      user = create(:user)
      first = create(:station, name: "1st", installation_date: Date.new(1991,12,10))
      second = create(:station, name: "2st", dock_count: 2)
      third = create(:station, name: "3st", dock_count: 9)
      fourth = create(:station, name: "4st", installation_date: Date.new(1991,12,16))
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/stations-dashboard'

      expect(page).to have_content("Total count of stations: 4")
      expect(page).to have_content("Average bikes available: 4.75")
      expect(page).to have_content("Most bikes available at any station: 9 #{third.name}")
      expect(page).to have_content("Fewest bikes available at any station: 2 #{second.name}")
      expect(page).to have_content("Most recently installed station: #{fourth.name}")
      expect(page).to have_content("Oldest station: #{first.name}")
    end
  end
end
