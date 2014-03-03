class ChangeDataToValueForData < ActiveRecord::Migration
  def change
    rename_column :data, :data, :value
  end
end
