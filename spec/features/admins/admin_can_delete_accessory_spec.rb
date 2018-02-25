require 'rails_helper'

describe "as an admin" do
  describe "when I visit the bike-shop" do
    describe "and click delete" do
      before(:each) do
        @accessory = create(:accessory)
        @admin = create(:admin)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      end
      it "it deletes accessory" do
        visit accessories_path

        click_on "Delete"

        expect(page).to have_content("Accessory successfully deleted")
        expect(page).to_not have_content(@accessory.name)
      end
    end
  end
end
