class Accessory < ApplicationRecord
  validates_presence_of :name, :price, :description, :status
  has_many :order_accessories
  has_many :orders, through: :order_accessories
  has_attached_file :avatar, :default_url => "default_img.jpg"
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  enum status: ["Active", "Retired"]

end
