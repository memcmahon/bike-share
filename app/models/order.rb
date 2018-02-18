class Order < ApplicationRecord
  validates_presence_of :cart_id, :user_id, :status

  belongs_to :user
  belongs_to :cart

  enum status: ["Ordered", "Paid", "Cancelled", "Completed"]
end
