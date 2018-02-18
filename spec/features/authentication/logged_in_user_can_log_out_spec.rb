require 'rails_helper'

describe "As a logged in user" do
  it "they can log out" do
    user = User.create(first_name: "Demo", last_name: "User", email: "demo@fakemail.com", password: "Test")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/dashboard"

    click_on("Log Out")

    expect(current_path).to eq(root_path)
  end
end
