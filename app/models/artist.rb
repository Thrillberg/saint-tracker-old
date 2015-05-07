class Artist < ActiveRecord::Base
  include Sluggable

  has_many :works
  has_many :artist_saints
  has_many :saints, through: :artist_saints

  validates :name, presence: :true

  sluggable_column :name

end