require 'rails_helper'

describe "as an admin" do
  describe "when I am on the bike-shop page and click edit" do
    describe "and fill the form, then hit update" do
      it "updates the accessory" do
        admin = create(:admin)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
        accessory = create(:accessory)

        visit accessories_path
        click_on "Edit"

        fill_in 'accessory[price]', with: '1200'
        fill_in 'accessory[name]', with: 'Wild Buttered Lettuce'
        fill_in 'accessory[description]', with: 'Found in the tundras of alaska. This lettuce has been naturally buttered by bears and beavers.'
        click_on "Update Accessory"

        expect(page).to have_content("You have successfully updated Wild Buttered Lettuce")
        expect(page).to have_content("Wild Buttered Lettuce")
        expect(page).to have_content('1200')
      end
    end
  end
end
