require 'rails_helper'

describe "as an admin" do
  describe "when I navigate to the conditions index" do
    it "I see an edit and delete button for each condition" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      condition = create_list(:condition, 4)
      visit conditions_path

      expect(page).to have_content("January 10, 1990", 4)
    end
  end
end
