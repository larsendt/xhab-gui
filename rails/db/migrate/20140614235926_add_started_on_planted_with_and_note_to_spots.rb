class AddStartedOnPlantedWithAndNoteToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :started_on, :date
    add_column :spots, :planted_with, :string
    add_column :spots, :note, :string
  end
end
