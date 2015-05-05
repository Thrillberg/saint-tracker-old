class AddGmapsColumnsToWorks < ActiveRecord::Migration
  def change
    add_column :works, :latitude, :float
    add_column :works, :longitude, :float
    add_column :works, :address, :string
  end
end
