class CreateSaints < ActiveRecord::Migration
  def change
    create_table :saints do |t|
      t.string :name, :attribute, :slug

      t.timestamps
    end
  end
end
