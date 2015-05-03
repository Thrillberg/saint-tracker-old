class CreateArtistSaints < ActiveRecord::Migration
  def change
    create_table :artist_saints do |t|
      t.integer :artist_id, :saint_id
    end
  end
end
