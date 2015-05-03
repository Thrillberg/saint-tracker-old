class CreateWorkSaints < ActiveRecord::Migration
  def change
    create_table :work_saints do |t|
      t.integer :work_id, :saint_id
    end
  end
end
