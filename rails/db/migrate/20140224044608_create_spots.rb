class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name
      t.string :key

      t.timestamps
    end
  end
end
