require 'rails_helper'

describe Cart, type: :model do
  describe "Validations" do
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :accessory_id }
    it { should validate_presence_of :user_id }
  end

  describe "Relationships" do
    it { should belong_to(:user) }
    it { should belong_to(:accessory) }
  end
end
