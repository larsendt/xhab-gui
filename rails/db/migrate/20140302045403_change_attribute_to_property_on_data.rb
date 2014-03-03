class ChangeAttributeToPropertyOnData < ActiveRecord::Migration
  def change
    rename_column :data, :attribute, :property
  end
end
