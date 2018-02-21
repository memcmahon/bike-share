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
      fill_in "condition[mean_humidity]", with: 12.2
      fill_in "condition[mean_visibility_miles]", with: 12.2
      fill_in "condition[mean_wind_speed_mph]", with: 12.2
      fill_in "condition[precipitation_inches]", with: 12.2
      fill_in "condition[zip_code]", with: 122323

      click_on "Create Condition"
      
      expect(page).to have_content("You have successfully created a condition")
      expect(page).to have_content("Conditions on December 12, 1232")
      expect(page).to have_content("Max Temperature: 12.2")
      expect(page).to have_content("Mean Temperature: 12.2")
      expect(page).to have_content("Minimum Temperature: 12.2")
      expect(page).to have_content("Mean Humidity: 12.2")
      expect(page).to have_content("Mean Visibility Levels: 12.2")
      expect(page).to have_content("Mean Wind Speed: 12.2")
      expect(page).to have_content("Precipitation Levels: 12.2")
      expect(page).to have_content("Zipcode: 122323")
    end
  end
end
