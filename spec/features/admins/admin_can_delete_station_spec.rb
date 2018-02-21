require 'rails_helper'

describe "As an admin" do
  describe "they can delete a station" do
    it "they delete the station" do
      admin = create(:admin)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit '/'

      expect(page).to have_content("")
    
    end
  end
end
