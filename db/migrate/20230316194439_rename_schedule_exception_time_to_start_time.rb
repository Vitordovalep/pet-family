class RenameScheduleExceptionTimeToStartTime < ActiveRecord::Migration[7.0]
  def change
    rename_column :schedule_exceptions, :time, :start_time
  end
end
