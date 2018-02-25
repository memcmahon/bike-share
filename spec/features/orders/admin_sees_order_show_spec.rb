require 'rails_helper'

describe "As an admin" do
  before(:each) do
    @admin = create(:admin, email: "admin@fakemail.com")
    @user_1 = create(:user)
    @accessory_1 = create(:accessory, name: "Thing 1")
    @accessory_2 = create(:accessory, name: "Thing 2")
    @accessory_3 = create(:accessory)
    @order_1 = @user_1.orders.create!(user: @user_1, status: 0)
    @line_1 = OrderAccessory.create!(order: @order_1, accessory: @accessory_1, quantity: 1)
    @line_2 = OrderAccessory.create!(order: @order_1, accessory: @accessory_2, quantity: 2)
    @line_3 = OrderAccessory.create!(order: @order_1, accessory: @accessory_3, quantity: 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    visit admin_order_path(@order_1)
  end

  describe "when they visit an order page" do
    it "they see the oder date and time" do
      expect(page).to have_content("Submitted At: #{@order_1.created_at}")
    end

    it "they see the purchaser's name and address" do
      expect(page).to have_content("Purchaser Name: #{@user_1.first_name} #{@user_1.last_name}")
      expect(page).to have_content("Purchaser Address: #{@user_1.address} #{@user_1.city} #{@user_1.state} #{@user_1.zip_code}")
    end

    it "they see a link to each order item page" do
      click_on(@accessory_2.name)

      expect(current_path).to eq(accessory_path(@accessory_2))
    end

    it "they see the quantity and item subtotal" do
      expect(page).to have_content("#{@accessory_3.name} quantity: 3 subtotal: #{@order_1.accessory_subtotal(@accessory_3.id)}")
    end

    it "they see the total for the order" do
      expect(page).to have_content("Total: #{@order_1.total}")
    end

    it "they see the status of the order" do
      expect(page).to have_content("Status: #{@order_1.status}")
    end
  end
end
