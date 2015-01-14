class AddIsClosedToSessionLogs < ActiveRecord::Migration
  def change
    add_column :session_logs, :isClosed, :boolean
  end
end
