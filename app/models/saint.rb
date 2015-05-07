class Saint < ActiveRecord::Base
  include Sluggable

  has_many :work_saints
  has_many :artist_saints
  has_many :works, through: :work_saints
  has_many :artists, through: :artist_saints

  validates :name, presence: true

  sluggable_column :name
  
end