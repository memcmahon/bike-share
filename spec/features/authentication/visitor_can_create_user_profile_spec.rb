require 'rails_helper'

describe "As a visitor they can create a user profile" do
  describe "when they visit root" do
    it "they can link to the login page" do
      visit root_path

      click_on("Log In")

      expect(page).to have_content("Create Account")
    end
  end

  describe "when they visit login page" do
    it "they can create a user profile" do
      visit login_path

      click_on("Create Account")

      fill_in("user[first_name]", with: "Demo")
      fill_in("user[last_name]", with: "User")
      fill_in("user[email]", with: "demo@fakemail.com")
      fill_in("user[password]", with: "Test")
      fill_in("user[password_confirmation]", with: "Test")
      click_on("Submit")

      expect(current_path).to eq('/dashboard')
      within ("navbar")
        expect(page).to have_content("Logged in as demo@fakemail.com")
      expect(page).to have_content("Log Out")
      expect(page).to_not have_content("Log In")
    end
  end
end
