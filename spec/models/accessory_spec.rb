require 'rails_helper'

describe Accessory, type: :model do
  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should validate_presence_of :description }
    it { should validate_presence_of :status }
  end

  describe "Relationships" do
    it { should have_many(:users).through(:carts) }
  end
end
