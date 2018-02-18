require 'rails_helper'

describe "As a registered user" do
  describe "they visit root path" do
    describe "they can log in" do
      user = User.create(first_name: "Demo", last_name: "User", email: "demo@fakemail.com", password: "Test")

      visit root_path

      click_on("Log In")

      fill_in("email", with: "demo@fakemail.com")
      fill_in("password", with: "Test")
      click_on("Log In")

      expect(current_path).to eq('/dashboard')
      within ("navbar")
        expect(page).to have_content("Logged in as demo@fakemail.com")
      expect(page).to have_content("Log Out")
      expect(page).to_not have_content("Log In")
    end
  end
end

# As a registered user,
# When I visit "/",
# I see a link for "Login",
#
# When I click "Login",
# I should be on the "/login" page,
# I see a place to insert my credentials to login,
# I fill in my desired credentials,
# I submit my information,
# My current page should be "/dashboard",
# I see a message in the navbar that says "Logged in as SOME_USER",
# I see my profile information,
# I do not see a link for "Login",
# I see a link for "Logout".
