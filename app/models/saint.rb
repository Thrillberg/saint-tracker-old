class Saint < ActiveRecord::Base
  has_many :work_saints
  has_many :artist_saints
  has_many :works, through: :work_saints
  has_many :artists, through: :artist_saints

  validates :name, presence: true
  
end