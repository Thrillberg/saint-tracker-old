class Artist < ActiveRecord::Base
  belongs_to :work
  has_many :artist_saints
  has_many :saints, through: :artist_saints

  validates :name, presence: :true

end