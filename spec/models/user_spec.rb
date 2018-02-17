require 'rails_helper'

describe User, type: :model do
  describe "Validations" do
    it { should have_secure_password }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of :email }
  end

  describe "Relationships" do
    it { should have_many :orders }
    it { should have_many :carts }
    it { should have_many :accessories .through :carts }
  end
end
