class AddTimesToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :white_light_on, :integer
    add_column :spots, :white_light_off, :integer
    add_column :spots, :red_light_on, :integer
    add_column :spots, :red_light_off, :integer
  end
end
