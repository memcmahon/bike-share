require 'rails_helper'

describe "as a user" do
  describe "when I visit the carts index page" do
    describe "when I click on add accessory" do
      before(:each) do
        @accessory = create(:accessory)
      end
      it "adds accessory to the cart" do
        visit accessories_path

        click_on 'Add to Cart'
        
        expect(page).to have_content("You now have 1 Wild Locally Sourced Buttered Lettuce in your cart")
      end
      it "incrememts correctly with consecutive button clicks" do
        visit accessories_path

        click_on 'Add to Cart'

        expect(page).to have_content("You now have 1 Wild Locally Sourced Buttered Lettuce in your cart")

        click_on 'Add to Cart'

        expect(page).to have_content("You now have 2 Wild Locally Sourced Buttered Lettuces in your cart")

      end
    end
  end
end
