require 'rails_helper'

describe "As a registered user and admin" do
  describe "As A regular user" do
    it "they can edit/modify their accounts" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit edit_user_path(user)

      expect(page).to have_content("Modify Account")

      fill_in "user[first_name]", with: "Drew"
      fill_in "user[last_name]", with: "Briggs"
      fill_in "user[email]", with: "theDB@gmail.com"
      fill_in "user[password]", with: "brigsy"
      fill_in "user[password_confirmation]", with: "brigsy"

      click_on "Submit"

      expect(current_path).to eq(dashboard_path)

      expect(page).to have_content("Drew")
      expect(page).to have_content("Briggs")
      expect(page).to have_content("theDB@gmail.com")
    end
  end

  describe "As A regular user" do
    it "they can edit/modify their accounts" do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_user_path(admin)

      expect(page).to have_content("Modify Account")

      fill_in "user[first_name]", with: "Drew"
      fill_in "user[last_name]", with: "Briggs"
      fill_in "user[email]", with: "theDB@gmail.com"
      fill_in "user[password]", with: "brigsy"
      fill_in "user[password_confirmation]", with: "brigsy"

      click_on "Submit"

      expect(current_path).to eq(admin_dashboard_path)

      expect(page).to have_content("Drew")
      expect(page).to have_content("Briggs")
      expect(page).to have_content("theDB@gmail.com")
    end
  end
end
