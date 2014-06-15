class AddStatesToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :fans, :boolean
    add_column :spots, :refresh, :boolean
    add_column :spots, :white_light_power, :boolean
    add_column :spots, :red_light_power, :boolean
    add_column :spots, :enclosure, :boolean
    add_column :spots, :h2o_level, :float
    add_column :spots, :battery_level, :float
  end
end
