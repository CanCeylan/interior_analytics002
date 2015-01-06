class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :length
      t.references :visitor, index: true
      t.references :location, index: true

      t.timestamps null: false
    end
    add_foreign_key :visits, :visitors
    add_foreign_key :visits, :locations
  end
end
