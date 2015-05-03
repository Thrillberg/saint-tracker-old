class RemoveSaintIdColumnFromWorks < ActiveRecord::Migration
  def change
    remove_column :works, :saint_id
  end
end
