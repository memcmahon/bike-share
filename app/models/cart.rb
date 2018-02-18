class Cart < ApplicationRecord
  validates_presence_of :quantity, :accessory_id, :user_id

  belongs_to :user
  belongs_to :accessory
end
