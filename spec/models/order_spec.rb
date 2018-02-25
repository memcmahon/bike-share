require 'rails_helper'

describe Order, type: :model do
  describe "Validations" do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :status }
  end

  describe "Relationships" do
    it { should belong_to(:user) }
    it { should have_many(:order_accessories) }
    it { should have_many(:accessories).through(:order_accessories) }
  end

  describe "Instance Methods" do
    before(:each) do
      user = create(:user)
      @accessories = create_list(:accessory, 2)
      @order = Order.create(user_id: user.id,
                            status: 0,
                            total: 6000)
      OrderAccessory.create(order_id: @order.id,
                      accessory_id: @accessories[0].id,
                      quantity: 2)
      OrderAccessory.create(order_id: @order.id,
                      accessory_id: @accessories[1].id,
                      quantity: 3)
    end
    describe "#accessory_quantity" do
      it "returns quantity of accessory in order" do
        expect(@order.accessory_quantity(@accessories[0].id)).to eq(2)
        expect(@order.accessory_quantity(@accessories[1].id)).to eq(3)
      end
    end
    describe "#accessory_subtotal" do
      it "returns subtotal cost of accessory order" do
        expect(@order.accessory_subtotal(@accessories[0].id)).to eq(2400)
        expect(@order.accessory_subtotal(@accessories[1].id)).to eq(3600)
      end
    end
  end
end
