class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title, :date, :city, :slug
      t.integer :artist_id, :saint_id, :user_id

      t.timestamps
    end
  end
end
