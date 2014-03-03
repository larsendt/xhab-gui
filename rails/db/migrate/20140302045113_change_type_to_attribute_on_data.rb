class ChangeTypeToAttributeOnData < ActiveRecord::Migration
  def change
    rename_column :data, :type, :attribute
  end
end
