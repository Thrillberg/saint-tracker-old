class User < ActiveRecord::Base
  include Sluggable

  has_many :comments
  has_many :works
  has_many :work_saints
  has_many :artist_saints

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 5}

  sluggable_column :username

  def admin?
    self.role == 'admin'
  end

  def moderator?
    self.role == 'moderator?'
  end

end