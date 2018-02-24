require 'rails_helper'

describe "as a user" do
  describe "when I visit the carts index page" do
    describe "when I click on add accessory" do
      it "adds accessory to the cart" do
        accessory = create(:accessory)

        visit accessories_path

        click_on 'Add to Cart'

        expect(page).to have_content("You have 1 accessory in your cart")
      end
    end
  end
end
