class ChangeColumnDefault < ActiveRecord::Migration
  def change
  	change_column_default(:session_logs, :duration, 0) 
  end
end
