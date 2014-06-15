class AddPumpFieldsToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :pump_duration, :integer
    add_column :spots, :pump_frequency, :integer
  end
end
