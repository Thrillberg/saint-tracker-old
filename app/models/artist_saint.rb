class ArtistSaint < ActiveRecord::Base
  belongs_to :artist
  belongs_to :saint
end