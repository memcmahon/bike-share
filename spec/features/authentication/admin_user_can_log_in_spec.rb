require 'rails_helper'

describe "As an admin" do
  describe "they visit the login page" do
    before(:each) do
      @admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end
    it "they can log in" do
      visit login_path

      fill_in("email", with: @admin.email)
      fill_in("password", with: @admin.password)
      click_on("LogIn")

      expect(current_path).to eq('/admin/dashboard')
    end
  end
end
