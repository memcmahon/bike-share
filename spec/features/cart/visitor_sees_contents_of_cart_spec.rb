require 'rails_helper'

describe "as a visitor" do
  describe "when I navigate to /cart from the cart button" do
    before(:each) do
      @accessory = create(:accessory)
    end
    it "shows cart contents and count" do

      visit '/cart'

      expect(page).to have_content("Cart Count: 0")

      visit accessories_path

      click_on "Add to Cart"

      visit '/cart'

      expect(page).to have_content("Cart Count: 1")
    end
  end
end
