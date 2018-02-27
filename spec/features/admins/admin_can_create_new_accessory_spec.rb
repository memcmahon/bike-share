require 'rails_helper'

describe "as an admin" do
  describe "when I am on the new accessory page" do
    describe "and fill out the form, then hit create" do
      it "creates a new accessory" do
        admin = create(:admin)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
        accessories = create_list(:accessory, 4)

        visit accessories_path
        click_on "Create Accessory"

        fill_in 'accessory[price]', with: '400'
        fill_in 'accessory[name]', with: 'Wild Locally Sourced Organic Buttered Lettuce'
        fill_in 'accessory[description]', with: 'Found in the tundras of alaska. This lettuce has been naturally buttered by bears and beavers.'
        click_on "Create Accessory"

        expect(page).to have_content("Wild Locally Sourced Organic Buttered Lettuce")
        expect(page).to have_content('$400.00')
      end
    end
  end
end
