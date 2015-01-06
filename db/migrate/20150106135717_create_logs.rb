class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :mac_id
      t.string :reason
      t.string :hierarchy
      t.integer :mapX
      t.integer :mapY
      t.datetime :firstTime
      t.datetime :lastTime
      t.datetime :serverTime

      t.timestamps null: false
    end
  end
end
