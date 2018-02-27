require 'rails_helper'

describe "as a registered user" do
  describe "when I view my dashboard" do
    describe "and click on my order" do
      before(:each) do
        @user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
        @accessory = create(:accessory)
      end
      it "shows the order details" do
        visit accessories_path

        click_on "Add to Cart"
        click_on "Add to Cart"

        visit cart_index_path

        click_on "Checkout"
        click_on Order.first.created_at

        expect(page).to have_content(@accessory.name)
        expect(page).to have_content("Subtotal: $2,400")
        expect(page).to have_content("Status: Ordered")
        expect(page).to have_content("Submitted At: #{Order.first.created_at}")
      end
    end
  end
end
