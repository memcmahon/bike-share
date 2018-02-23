class Accessory < ApplicationRecord
  validates_presence_of :name, :price, :description, :status

  enum status: ["Active", "Retired"]

  def convert_to_dollars
    price.to_s.insert(-3, '.').prepend('$')
  end

end
