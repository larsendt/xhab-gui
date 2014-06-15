class AddAttributesToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :set_air_temp_high, :float
    add_column :spots, :set_air_temp_low, :float
    add_column :spots, :set_water_temp_high, :float
    add_column :spots, :set_water_temp_low, :float
    add_column :spots, :set_rh_high, :float
    add_column :spots, :set_rh_low, :float
    add_column :spots, :set_ec_high, :float
    add_column :spots, :set_ec_low, :float
    add_column :spots, :set_ph_high, :float
    add_column :spots, :set_ph_low, :float
    add_column :spots, :set_co2_high, :float
    add_column :spots, :set_co2_low, :float
    add_column :spots, :timezone, :string
    add_column :spots, :white_light_on, :timestamp
    add_column :spots, :white_light_off, :timestamp
    add_column :spots, :red_light_on, :timestamp
    add_column :spots, :red_light_off, :timestamp
    add_column :spots, :air_temp, :float
    add_column :spots, :water_temp, :float
    add_column :spots, :rh, :float
    add_column :spots, :ec, :float
    add_column :spots, :ph, :float
    add_column :spots, :co2, :float
  end
end
