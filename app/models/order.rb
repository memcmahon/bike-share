class Order < ApplicationRecord
  validates_presence_of :user_id, :status
  has_many :order_accessories
  has_many :accessories, through: :order_accessories
  belongs_to :user

  enum status: ["Ordered", "Paid", "Cancelled", "Completed"]
end
