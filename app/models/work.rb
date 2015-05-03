class Work < ActiveRecord::Base
  belongs_to :user
  belongs_to :artist
  has_many :comments
  has_many :work_saints
  has_many :saints, through: :work_saints

  validates :title, presence: true
  validates :date, presence: true
  validates :city, presence: true
  validates :image, presence: true, uniqueness: true
end