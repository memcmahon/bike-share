require 'rails_helper'

describe "as a visitor" do
  describe "when I navigate to /cart from the cart button" do
    before(:each) do
      @accessory = create(:accessory)
    end
    it "shows cart contents and count" do

      visit cart_index_path

      expect(page).to have_content("Cart Count: 0")

      visit accessories_path

      click_on "Add to Cart"

      visit cart_index_path

      expect(page).to have_content("Cart Count: 1")
      expect(page).to have_link("Please Sign Up Or Log In")
    end
    it "increases accessory count" do
      visit accessories_path

      click_on "Add to Cart"

      visit cart_index_path


      click_on "Increase"

      expect(page).to have_content("You have added 1 #{@accessory.name}")
      expect(page).to have_content("Cart Count: 2")
    end
    it "decreases accessory count" do
      visit accessories_path

      click_on "Add to Cart"

      visit cart_index_path

      click_on "Increase"

      expect(page).to have_content("Cart Count: 2")

      click_on "Decrease"

      expect(page).to have_content("You have lost 1 #{@accessory.name}")
      expect(page).to have_content("Cart Count: 1")
    end
    it "removes accessory from cart" do
      visit accessories_path

      click_on "Add to Cart"

      visit cart_index_path

      click_on "Remove Accessory"

      expect(page).to have_content("You have removed #{@accessory.name} from the cart.")
      expect(page).to have_content("Cart Count: 0")
    end
  end
end
