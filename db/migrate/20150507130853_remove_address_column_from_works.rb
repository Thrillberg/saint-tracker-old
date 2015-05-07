class RemoveAddressColumnFromWorks < ActiveRecord::Migration
  def change
    remove_column :works, :address
  end
end
