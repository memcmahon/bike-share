require 'rails_helper'

describe "as an admin" do
  describe "when I visit the index page" do
    it "shows all accessories" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      accessories = create_list(:accessory, 4)

      visit 'admin/dashboard'
      click_on 'Bike-Shop'

      expect(page).to have_link(accessories[0].name)
      expect(page).to have_link(accessories[1].name)
      expect(page).to have_link(accessories[2].name)
      expect(page).to have_link(accessories[3].name)
      expect(page).to have_link("Edit")
      expect(page).to have_link("Create Accessory")
    end
    it "doesn't show edit and delete for user" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      accessories = create_list(:accessory, 4)

      visit root_path
      click_on "Bike Shop"

      expect(page).to have_link(accessories[0].name)
      expect(page).to have_link(accessories[1].name)
      expect(page).to have_link(accessories[2].name)
      expect(page).to have_link(accessories[3].name)
      expect(page).to_not have_link("Edit")
      expect(page).to_not have_link("Create Accessory")
    end
  end
end
