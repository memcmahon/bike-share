require 'rails_helper'

describe "visitor sees under construction page" do
  context "when they visit a root" do
    it "show under construction" do
      visit root_path
      
      expect(page).to have_content("Alchemists Cyclery")
      expect(page).to have_content("Exploring the Bay Area Bike Share")
    end
  end
end
