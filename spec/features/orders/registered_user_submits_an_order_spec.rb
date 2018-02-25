require 'rails_helper'

describe "as a registered user" do
  describe "when I add to cart and go to /cart" do
    describe "then click on Checkout" do
      it "submits my order and redirects to my dashboard" do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        accessory = create(:accessory)

        visit accessories_path

        click_on "Add to Cart"
        click_on "Add to Cart"

        visit cart_index_path

        click_on "Checkout"

        expect(current_path).to eq('/dashboard')
        expect(page).to have("Your order has been successfully submitted")
        expect(page).to have_link("Order: 1")
      end
    end
  end
end
