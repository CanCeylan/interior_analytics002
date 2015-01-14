class CreateSessionLogs < ActiveRecord::Migration
  def change
    create_table :session_logs do |t|
      t.string :macID
      t.datetime :logTime
      t.references :location, index: true
      t.integer :duration, default: 0

      t.timestamps null: false
    end
    add_foreign_key :session_logs, :locations
  end
end
