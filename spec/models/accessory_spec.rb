require 'rails_helper'

describe Accessory, type: :model do
  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should validate_presence_of :description }
    it { should validate_presence_of :status }
  end

  describe "Relationships" do
    it {should have_many(:order_accessories)}
    it {should have_many(:orders).through(:order_accessories)}
  end

  describe "Instance Methods" do
    before(:each) do
      @accessory_1 = create(:accessory, price: 30000)
      @accessory_2 = create(:accessory, price: 12340)
    end
  end
end
