class AddPointerToSessionLogs < ActiveRecord::Migration
  def change
    add_column :session_logs, :pointer, :datetime
  end
end
