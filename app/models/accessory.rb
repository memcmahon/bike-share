class Accessory < ApplicationRecord
  validates_presence_of :name, :price, :description, :status
  has_many :order_accessories
  has_many :orders, through: :order_accessories
  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  enum status: ["Active", "Retired"]

  def convert_to_dollars
    price.to_s.insert(-3, '.').prepend('$')
  end

end
