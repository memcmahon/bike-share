require 'rails_helper'

describe "As a visitor" do
  describe "They can visit trips index" do
    it "They can see first 30 trips" do
      trip = create_list(:trip, 35)

      visit trips_path

      binding.pry
    end
  end
end
