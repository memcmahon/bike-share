class Status < ApplicationRecord
  validates_presence_of :bikes_available,
                        :docks_available,
                        :time
  belongs_to :station
end
