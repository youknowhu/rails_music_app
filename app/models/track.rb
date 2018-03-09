class Track < ApplicationRecord
  validates :album, :track_type, :title, :ord, presence: true

  belongs_to :album
  has_many :notes

  has_one :band,
  through: :album,
  source: :band

end
