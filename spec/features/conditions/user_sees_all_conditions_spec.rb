require 'rails_helper'

describe "user sees all conditions" do
  context "link from the root path" do
    it "shows all conditions" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      condition = create(:condition)

      visit root_path
      click_on "Conditions"

      expect(current_path).to eq(conditions_path)
      expect(page).to have_content(condition.max_temp_f)
      expect(page).to have_content(condition.mean_temp_f)
      expect(page).to have_content(condition.min_temp_f)
      expect(page).to have_content(condition.mean_visibility_miles)
      expect(page).to have_content(condition.mean_wind_speed_mph)
      expect(page).to have_content(condition.precipitation_inches)
      expect(page).to have_content(condition.date)
    end
  end
end
