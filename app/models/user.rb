class User < ApplicationRecord
  has_secure_password

  validates_presence_of :first_name, :last_name, :email, :password
  validates_uniqueness_of :email

  has_many :orders
  has_many :carts
  has_many :accessories, through: :carts

  enum role: ["default", "admin"]
end
