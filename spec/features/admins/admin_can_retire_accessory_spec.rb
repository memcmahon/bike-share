require 'rails_helper'

describe "as an admin" do
  describe "when I am on admin/bike-shop" do
    describe "and click retire" do
      before(:each) do
        accessory = create(:accessory)
        @admin = create(:admin)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      end
      it "retires accessory" do
        visit admin_accessories_path
        save_and_open_page
        click_on "Retire"

        expect(page).to have_content("Item is Retired")
        expect(page).to_not have_button("Add to Cart")
      end
    end
  end
end
