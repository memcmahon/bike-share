require 'rails_helper'

describe "As a registered user" do
  describe "they visit root path" do
    it "they can log in" do
      user = User.create(first_name: "Demo", last_name: "User", email: "demo@fakemail.com", password: "Test")

      visit root_path

      click_on("Log In")

      fill_in("email", with: "demo@fakemail.com")
      fill_in("password", with: "Test")
      click_on("LogIn")

      expect(current_path).to eq('/dashboard')
      within ("navbar")
        expect(page).to have_content("Logged in as demo@fakemail.com")
        expect(page).to have_content("Log Out")
        expect(page).to_not have_content("Log In")
    end
  end
end
