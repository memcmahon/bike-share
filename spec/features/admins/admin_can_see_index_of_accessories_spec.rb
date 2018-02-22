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
    end
  end
end
