class Artist < ActiveRecord::Base
  has_many :works
  has_many :artist_saints
  has_many :saints, through: :artist_saints

  validates :name, presence: :true

  def name_for_dropdown
    "#{name}"
  end

end