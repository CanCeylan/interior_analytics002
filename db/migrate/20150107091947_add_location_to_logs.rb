class AddLocationToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :location, :integer
  end
end
