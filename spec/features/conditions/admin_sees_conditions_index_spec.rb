require 'rails_helper'

describe "as an admin" do
  describe "when I navigate to the conditions index" do
    it "I see an edit and delete button for each condition" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      create_list(:condition, 4)
      visit admin_conditions_path

      expect(page).to have_button("Delete")
      expect(page).to have_link("Edit")
    end
  end
end
