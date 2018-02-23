require 'rails_helper'

describe "as a user" do
  describe "when I visit the carts index page" do
    describe "when I click on add accessory" do
      it "adds accessory to the cart" do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        accessory = create(:accessory)

        visit accessories_path

        click_on "Add Accessory"

        expect(page).to have_content("You have 1 accessory in your cart")
      end
    end
  end
end
