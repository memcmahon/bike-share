require 'rails_helper'

describe "As a visitor" do
  describe "they can visit stations index" do
    it "they see all stations info" do
      create_list(:station, 84)

      visit stations_path

      expect(page).to have_content("1 Street  ")
      expect(page).to have_content("1")
      expect(page).to have_content("San Francisco")
      expect(page).to have_content("1991-12-12")
      expect(page).to have_css(".station-container", count: 30)
      expect(Station.all.count).to eq(84)
    end
  end
end

