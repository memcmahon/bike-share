class Accessory < ApplicationRecord
  validates_presence_of :name, :price, :description, :status

  has_many :carts
  has_many :users, through: :carts

  enum status: ["Active", "Retired"]
end
