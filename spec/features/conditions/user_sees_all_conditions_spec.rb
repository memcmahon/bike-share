require 'rails_helper'

describe "user sees all conditions" do
  context "link from the root path" do
    it "shows all conditions" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      condition = create_list(:condition, 2)

      visit root_path
      click_on "Conditions"

      expect(current_path).to eq(conditions_path)
      expect(page).to have_content(condition[0].max_temp_f)
      expect(page).to have_content(condition[0].mean_temp_f)
      expect(page).to have_content(condition[0].min_temp_f)
      expect(page).to have_content(condition[0].mean_visibility_miles)
      expect(page).to have_content(condition[0].mean_wind_speed_mph)
      expect(page).to have_content(condition[0].precipitation_inches)
      expect(page).to have_content(condition[0].date)

      expect(page).to have_content(condition[1].max_temp_f)
      expect(page).to have_content(condition[1].mean_temp_f)
      expect(page).to have_content(condition[1].min_temp_f)
      expect(page).to have_content(condition[1].mean_visibility_miles)
      expect(page).to have_content(condition[1].mean_wind_speed_mph)
      expect(page).to have_content(condition[1].precipitation_inches)
      expect(page).to have_content(condition[1].date)
    end
  end
end
