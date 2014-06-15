class AddDoToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :do, :float
    add_column :spots, :set_do_high, :float
    add_column :spots, :set_do_low, :float
  end
end
