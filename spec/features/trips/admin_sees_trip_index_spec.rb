require 'rails_helper'

describe "As an admin" do
  before(:each) do
    @admin = create(:admin)
    @trip = create_list(:trip, 35)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    visit trips_path
  end
  describe "They can visit trips index" do
    it "They can see first 30 trips" do
      expect(page).to have_content(@trip[0].duration)
      expect(page).to have_content(@trip[1].duration)
      expect(page).to have_content(@trip[2].duration)
      expect(page).to have_content(@trip[3].duration)
      expect(page).to have_content(@trip[4].duration)
      expect(page).to have_content(@trip[5].duration)
      expect(page).to have_content(@trip[6].duration)
      expect(page).to have_content(@trip[7].duration)
      expect(page).to have_content(@trip[8].duration)
      expect(page).to have_content(@trip[9].duration)
      expect(page).to have_content(@trip[10].duration)
      expect(page).to have_content(@trip[11].duration)
      expect(page).to have_content(@trip[12].duration)
      expect(page).to have_content(@trip[13].duration)
      expect(page).to have_content(@trip[14].duration)
      expect(page).to have_content(@trip[15].duration)
      expect(page).to have_content(@trip[16].duration)
      expect(page).to have_content(@trip[17].duration)
      expect(page).to have_content(@trip[18].duration)
      expect(page).to have_content(@trip[19].duration)
      expect(page).to have_content(@trip[20].duration)
      expect(page).to have_content(@trip[21].duration)
      expect(page).to have_content(@trip[22].duration)
      expect(page).to have_content(@trip[23].duration)
      expect(page).to have_content(@trip[24].duration)
      expect(page).to have_content(@trip[25].duration)
      expect(page).to have_content(@trip[26].duration)
      expect(page).to have_content(@trip[27].duration)
      expect(page).to have_content(@trip[28].duration)
      expect(page).to_not have_content(@trip[31].duration)
    end

    it "they can click through to next page of trips" do
      click_on("Next", match: :first)

      expect(page).to_not have_content(@trip[24].duration)
      expect(page).to have_content(@trip[30].duration)
      expect(page).to have_content(@trip[31].duration)
      expect(page).to have_content(@trip[32].duration)
      expect(page).to have_content(@trip[33].duration)
      expect(page).to have_content(@trip[34].duration)
    end

    it "they see a link to edit and delete each trip" do
      expect(page).to have_content("Edit", :count => 30)
      expect(page).to have_content("Delete", :count => 30)
    end
  end
end
