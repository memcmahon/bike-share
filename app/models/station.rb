class Station < ApplicationRecord
  validates_presence_of :name,
                        :lat,
                        :long,
                        :dock_count,
                        :city,
                        :installation_date
  has_many :statuses
  before_save :generate_slug

  def generate_slug
    self.slug = name.parameterize if name
  end

  def self.total_count_of_stations
    count
  end

  
end
