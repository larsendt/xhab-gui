class AddDockedToRogrs < ActiveRecord::Migration
  def change
    add_column :rogrs, :docked, :boolean
  end
end
