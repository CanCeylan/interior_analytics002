class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :mac_id
      t.string :ip_address
      t.datetime :firstLocatedTime
      t.integer :at_location, default: 0

      t.timestamps null: false
    end
  end
end
