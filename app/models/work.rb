class Work < ActiveRecord::Base
  include Sluggable

  belongs_to :user
  belongs_to :artist
  has_many :comments
  has_many :work_saints
  has_many :saints, through: :work_saints

  validates :title, presence: true
  validates :date, presence: true
  validates :city, presence: true
  validates :image, presence: true, uniqueness: true
  validates_format_of :image, :with => %r{\.(png|jpg|jpeg)$}i, :message => "must be an image.", multiline: true
  
  sluggable_column :title

  attr_accessor :new_artist
  attr_accessor :hash
  before_save :create_artist

  accepts_nested_attributes_for :artist, :update_only => true

  geocoded_by :city
  after_validation :geocode

  def create_artist
    self.artist = Artist.create!(name: new_artist) if new_artist.present?
  end

  private  

  def artist_params
    params.require(:artist_id).permit(:name, :dates)
  end

end