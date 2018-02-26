require 'rails_helper'

describe "As a visitor" do
  describe "I can view the accessory show page" do
    it "I see the accessory show page" do
      item = create(:accessory)
      create(:accessory, price: 300)

      visit accessories_path

      expect(page).to have_content("Bike Shop")
      expect(page).to have_button("Add to Cart")

      visit accessory_path(item)    

      expect(page).to have_content("Wild Locally Sourced Buttered Lettuce")
      expect(page).to have_content("Found in the tundras of alaska. This lettuce has been naturally buttered by bears and beavers.")
      expect(page).to have_content("$12.00")
    end
  end
end
