class Accessory < ApplicationRecord
  validates_presence_of :name, :price, :description, :status
  has_many :order_accessories
  has_many :orders, through: :order_accessories
  has_attached_file :avatar,
                    storage: :s3,
                    s3_credentials: {access_key_id: ENV["AKIAIKHQYSMPYQKMO4FQ"],
                                     secret_access_key: ENV["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"]},
                    bucket: "bike-share-assets"
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  enum status: ["Active", "Retired"]

  def convert_to_dollars
    price.to_s.insert(-3, '.').prepend('$')
  end

end
