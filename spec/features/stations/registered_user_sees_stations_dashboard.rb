require 'rails_helper'

describe "As a registered user and admin" do
  describe "when I visit the stations-dashboard" do
    it "I see station analytics" do

      visit '/stations-dashboard'

      expect(page).to have_content("Total count of stations: 84")
    end
  end
end
