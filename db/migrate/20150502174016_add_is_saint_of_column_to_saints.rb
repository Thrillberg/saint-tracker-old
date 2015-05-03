class AddIsSaintOfColumnToSaints < ActiveRecord::Migration
  def change
    rename_column :saints, :attribute, :is_saint_of
  end
end
