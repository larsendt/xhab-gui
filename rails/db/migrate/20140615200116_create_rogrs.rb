class CreateRogrs < ActiveRecord::Migration
  def change
    create_table :rogrs do |t|
      t.string :name
      t.string :key
      t.boolean :water_pump_power
      t.boolean :nutrient_pump_power
      t.float :water_level
      t.float :nutrient_level
      t.float :battery_level

      t.timestamps
    end
  end
end
