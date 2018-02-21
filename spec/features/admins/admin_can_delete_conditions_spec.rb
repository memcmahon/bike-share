require 'rails_helper'

describe "as an admin" do
  describe "when I am on the conditions index page" do
    it "can delete a condition" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      condition = create(:condition)

      visit admin_conditions_path
      click_on "Delete"

      expect(page).to_not have_link(condition.date)
    end
  end
end
