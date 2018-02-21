require 'rails_helper'

describe 'as an admin' do
  describe 'when I navigate to the condition show page' do
    it 'shows delete and edit links' do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      condition = create(:condition)

      visit admin_condition_path(condition)

      expect(page).to have_button("Delete")
      expect(page).to have_link("Edit")
      expect(page).to have_content(condition.max_temp_f)
      expect(page).to have_content(condition.mean_temp_f)
      expect(page).to have_content(condition.min_temp_f)
      expect(page).to have_content(condition.max_dew_point_f)
      expect(page).to have_content(condition.mean_dew_point_f)
      expect(page).to have_content(condition.max_humidity)
      expect(page).to have_content(condition.mean_humidity)
      expect(page).to have_content(condition.min_humidity)
      expect(page).to have_content(condition.max_sea_level_pressure_inches)
      expect(page).to have_content(condition.mean_sea_level_pressure_inches)
      expect(page).to have_content(condition.min_sea_level_pressure_inches)
      expect(page).to have_content(condition.max_visibility_miles)
      expect(page).to have_content(condition.mean_visibility_miles)
      expect(page).to have_content(condition.min_visibility_miles)
      expect(page).to have_content(condition.max_wind_speed_mph)
      expect(page).to have_content(condition.mean_wind_speed_mph)
      expect(page).to have_content(condition.max_gust_speed_mph)
      expect(page).to have_content(condition.precipitation_inches)
      expect(page).to have_content(condition.cloud_cover)
      expect(page).to have_content(condition.events)
      expect(page).to have_content(condition.wind_dir_degrees)
      expect(page).to have_content(condition.zip_code)
      expect(page).to have_content(condition.date)
    end
  end
end
