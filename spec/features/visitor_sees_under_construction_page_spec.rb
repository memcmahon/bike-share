require 'rails_helper'

describe "visitor sees under construction page" do
  context "when they visit a root" do
    it "show under construction" do
      visit root_path

      expect(page).to have_content("Sorry")
      expect(page).to have_content("This Site is Under Construction")
    end
  end
end
