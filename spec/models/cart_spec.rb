require 'rails_helper'

describe Cart, type: :model do
  describe "Instance Methods" do
    before(:each) do
      @cart = Cart.new({'1' => 23, '2' => 22})
      @accessory = create(:accessory, id: 1)
      @accessory_2 = create(:accessory, id: 2)
    end

    describe "#add_accessory" do
      it "adds id to hash and increments its value by 1" do
        @cart.add_accessory(3)
        expect(@cart.contents['3']).to eq(1)
        @cart.add_accessory(2)
        expect(@cart.contents['2']).to eq(23)
      end
    end

    describe "#lose_accessory" do
      it "decreases the value of the argument passed in" do
        @cart.lose_accessory(2)
        expect(@cart.contents['2']).to eq(21)
        @cart.lose_accessory(2)
        expect(@cart.contents['2']).to eq(20)
      end
    end

    describe "#remove_accessory" do
      it "removes key from contents" do
        expect(@cart.contents).to eq({'1' => 23, '2' => 22})
        @cart.remove_accessory('2')
        expect(@cart.contents).to eq({'1' => 23})
      end
    end

    describe "#total_count" do
      it "returns the sum of the contents values" do
        expect(@cart.total_count).to eq(45)
      end
    end

    describe "#count_of" do
      it "returns the value of argmument passed" do
        expect(@cart.count_of(2)).to eq(22)
      end
    end

    describe "#subtotal" do
      it "returns total price of accessories" do
        expect(@cart.subtotal(@accessory)).to eq(@accessory.price * @cart.contents['1'])
      end
    end

    describe "#cart_accessories" do
      it "returns array of accessories associated with keys" do
        expect(@cart.cart_accessories).to eq([@accessory, @accessory_2])
      end
    end
  end
end
