class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.integer :timestamp
      t.string :source
      t.string :type
      t.float :data
    end

    add_index :data, :timestamp
    add_index :data, :source
    add_index :data, :type
  end
end
