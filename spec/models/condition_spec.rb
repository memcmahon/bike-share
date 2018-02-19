require 'rails_helper'

describe Condition, type: :model do
  describe "validations" do
    it {should validate_presence_of(:date)}
  end

  describe "relationships" do
    it {should have_many(:trips)}
  end

  describe "instance methods" do
    it "converts datetime to month and day" do
      condition = create(:condition, date: '12/12/2017')

      expect(condition.month_day_converter).to eq('December 12, 2017')
    end
  end
end
