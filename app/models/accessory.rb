class Accessory < ApplicationRecord
  validates_presence_of :name, :price, :description, :status
  
  enum status: ["Active", "Retired"]
end
