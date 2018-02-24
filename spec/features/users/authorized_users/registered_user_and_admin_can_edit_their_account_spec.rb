require 'rails_helper'

describe "As a registered user and admin" do
  it "they can edit/modify their accounts" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_user_path(user)

    expect(page).to have_content("Modify Account")
  save_and_open_page
  end
end
