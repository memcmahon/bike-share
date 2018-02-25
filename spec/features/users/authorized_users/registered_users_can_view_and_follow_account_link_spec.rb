require 'rails_helper'

describe "As a registered user" do
  describe "when I'm on a regular user page I can always see my account link" do
    it "I click on the Account link" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit stations_path

      click_on "Account"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("#{user.first_name}'s")
    end
  end

  describe "when I'm on an admins user page I can always see my account link" do
    it "I click on the Account link" do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit stations_path

      click_on "Account"

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content("#{admin.first_name}'s")
    end
  end
end
