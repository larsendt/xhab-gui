class RemoveFansFromSpots < ActiveRecord::Migration
  def change
    remove_column :spots, :fans
  end
end
