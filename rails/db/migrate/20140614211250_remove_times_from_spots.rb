class RemoveTimesFromSpots < ActiveRecord::Migration
  def change
    remove_column :spots, :white_light_on, :string
    remove_column :spots, :white_light_off, :string
    remove_column :spots, :red_light_on, :string
    remove_column :spots, :red_light_off, :string
  end
end
