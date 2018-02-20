require 'rails_helper'

describe "As an admin" do
  before(:each) do
    @admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end

  describe "they visit the login page" do
    it "they can log in" do
      visit login_path

      fill_in("email", with: @admin.email)
      fill_in("password", with: @admin.password)
      click_on("LogIn")

      expect(current_path).to eq('/admin/dashboard')
    end
  end

  describe "they visit admin/dashboard" do
    it "they see their user profile" do
      visit admin_dashboard_path

      expect(page).to have_content(@admin.first_name)
      expect(page).to have_content(@admin.last_name)
      expect(page).to have_content(@admin.email)
    end

    it "they see a log out link, but not a log in link" do
      visit admin_dashboard_path

      expect(page).to have_content("Log Out")
      expect(page).to_not have_content("Log In")
    end
  end
end
