require 'rails_helper'

describe "As an admin" do
  before(:each) do
    @admin = create(:admin, email: "admin@fakemail.com")
    @user_1 = create(:user)
    @accessory_1 = create(:accessory, name: "Thing 1")
    @accessory_2 = create(:accessory, name: "Thing 2")
    @accessory_3 = create(:accessory)
    @order_1 = @user_1.orders.create!(user: @user_1, status: 0)
    @order_2 = @user_1.orders.create!(id: 11388, user: @user_1, status: 1)
    @order_3 = @user_1.orders.create!(user: @user_1, status: 2)
    @order_4 = @user_1.orders.create!(user: @user_1, status: 1)
    @line_1 = OrderAccessory.create!(order: @order_1, accessory: @accessory_1, quantity: 1)
    @line_2 = OrderAccessory.create!(order: @order_1, accessory: @accessory_2, quantity: 2)
    @line_3 = OrderAccessory.create!(order: @order_1, accessory: @accessory_3, quantity: 3)
    @line_4 = OrderAccessory.create!(order: @order_2, accessory: @accessory_1, quantity: 3)
    @line_5 = OrderAccessory.create!(order: @order_2, accessory: @accessory_2, quantity: 2)
    @line_6 = OrderAccessory.create!(order: @order_2, accessory: @accessory_3, quantity: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    visit admin_dashboard_path
  end

  describe "They visit admin/dashboard" do
    it "they see a list of all orders with links to orders" do
      expect(page).to have_content("All Orders")
      expect(page).to have_link("Order: #{@order_1.id}")
      expect(page).to have_link("Order: #{@order_2.id}")
      expect(page).to have_content(@order_1.total)
      expect(page).to have_content(@order_1.status)
      expect(page).to have_content(@order_2.total)
      expect(page).to have_content(@order_2.status)
    end

    it "they can cancel orders that are paid or ordered" do
      expect(page).to have_button("Cancel", exact: true, count: 3)

      click_button("Cancel", match: :first)

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_button("Cancel", exact: true, count: 2)
    end

    it "they can mark as paid on orders that are ordered" do
      expect(page).to have_button("Mark as Paid", count: 1)

      click_button("Mark as Paid")

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_button("Mark as Completed", count: 3)
    end

    it "they can mark as completed on orders that are paid" do
      click_button("Mark as Completed", match: :first)

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_button("Cancel", exact: true, count: 2)
    end
  end

  describe "they visit admin dashboard" do
    it "they see the number of orders by status" do
      expect(page).to have_content("Ordered(1)")
      expect(page).to have_content("Paid(2)")
      expect(page).to have_content("Cancelled(1)")
    end

    it "they can link to a list of only orders in a specific status" do
      click_link("Ordered(1)")

      expect(page).to have_content(@order_1.id)
      expect(page).to_not have_content(@order_2.id)
    end
  end
end
