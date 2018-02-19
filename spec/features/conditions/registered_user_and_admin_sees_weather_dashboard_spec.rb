require 'rails_helper'

describe "As a registered user and admin" do
  describe "when I visit the weather-dashboard" do
    it "shows weather analytics" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      conditions = create_list(:condition, 5)
      trips_1 = create_list(:trip, 3, condition_id: conditions[0].id)
      trips_2 = create_list(:trip, 3, condition_id: conditions[1].id)
      trips_3 = create_list(:trip, 3, condition_id: conditions[2].id)
      trips_4 = create_list(:trip, 3, condition_id: conditions[3].id)
      trips_5 = create_list(:trip, 3, condition_id: conditions[4].id)

      visit '/weather-dashboard'

      expect(page).to have_content("Weather Dashboard")
    end
  end
end
