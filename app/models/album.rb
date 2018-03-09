class Album < ApplicationRecord
  validates :band, :title, :location, :year, presence: true
  belongs_to :band
  has_many :tracks

end
