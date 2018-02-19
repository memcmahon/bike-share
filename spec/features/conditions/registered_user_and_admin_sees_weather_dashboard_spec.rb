require 'rails_helper'

describe "As a registered user and admin" do
  describe "when I visit the weather-dashboard" do
    it "shows weather analytics" do
      visit '/weather-dashboard'

      expect(page).to have_content("Weather Dashboard")
    end
  end
end
