class AddFanPowerToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :fan_power, :boolean
  end
end
