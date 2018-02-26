git require 'rails_helper'

describe "As a visitor" do
  describe "I have limitted access in the app" do
    it "a visitor cannot visit an admins dashboard" do
      visit admin_dashboard_path

      expect(page).to have_content("404")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end

    it "a visitor cannot visit an registered users dashboard" do
      visit dashboard_path

      expect(page).to have_content("Log In")
      expect(page).to have_content("Sign Up")
    end
  end
end