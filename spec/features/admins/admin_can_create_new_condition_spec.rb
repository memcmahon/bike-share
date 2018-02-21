require 'rails_helper'

describe "as an admin" do
  describe "when I navigate to conditions/new and fill the form" do
    it "creates a new condition" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_condition_path

      fill_in "condition[date]", with: '12/12/1232'
      fill_in "condition[max_temp_f]", with: 12.2
      fill_in "condition[mean_temp_f]", with: 12.2
      fill_in "condition[min_temp_f]", with: 12.2
      fill_in "condition[max_dew_point_f]", with: 12.2
      fill_in "condition[mean_dew_point_f]", with: 12.2
      fill_in "condition[min_dew_point_f]", with: 12.2
      fill_in "condition[max_humidity]", with: 12.2
      fill_in "condition[mean_humidity]", with: 12.2
      fill_in "condition[min_humidity]", with: 12.2
      fill_in "condition[max_sea_level_pressure_inches]", with: 12.2
      fill_in "condition[mean_sea_level_pressure_inches]", with: 12.2
      fill_in "condition[min_sea_level_pressure_inches]", with: 12.2
      fill_in "condition[max_visibility_miles]", with: 12.2
      fill_in "condition[mean_visibility_miles]", with: 12.2
      fill_in "condition[min_visibility_miles]", with: 12.2
      fill_in "condition[max_wind_Speed_mph]", with: 12.2
      fill_in "condition[mean_wind_speed_mph]", with: 12.2
      fill_in "condition[max_gust_speed_mph]", with: 12.2
      fill_in "condition[precipitation_inches]", with: 12.2
      fill_in "condition[cloud_cover]", with: 12.2
      fill_in "condition[events]", with: 'Fog'
      fill_in "condition[wind_dir_degrees]", with: 12.2
      fill_in "condition[zip_code]", with: 122323

      click_on "Create Condition"

      expect(page).to have_content("Conditions on '12/12/1232'")
      expect(page).to have_content("Max Temperature: 12.2")
      expect(page).to have_content("Mean Temperature: 12.2")
      expect(page).to have_content("Minimum Temperature: 12.2")
      expect(page).to have_content("Max Dew Point: 12.2")
      expect(page).to have_content("Mean Dew Point: 12.2")
      expect(page).to have_content("Max Humidity: 12.2")
      expect(page).to have_content("Mean Humidity: 12.2")
      expect(page).to have_content("Minimum Humidity: 12.2")
      expect(page).to have_content("Max Sea Level Pressure: 12.2")
      expect(page).to have_content("Mean Sea Level Pressure: 12.2")
      expect(page).to have_content("Minimum Sea Level Pressure: 12.2")
      expect(page).to have_content("Max Visibility Levels: 12.2")
      expect(page).to have_content("Mean Visibility Levels: 12.2")
      expect(page).to have_content("Minimum Visibility Levels: 12.2")
      expect(page).to have_content("Max Wind Speed: 12.2")
      expect(page).to have_content("Mean Wind Speed: 12.2")
      expect(page).to have_content("Max Gust Speed: 12.2")
      expect(page).to have_content("Precipitation Levels: 12.2")
      expect(page).to have_content("Cloud Coverage: 12.2")
      expect(page).to have_content("Possible Events: Fog")
      expect(page).to have_content("Wind Direction: 12.2")
      expect(page).to have_content("Zipcode: 122323")
    end
  end
end
