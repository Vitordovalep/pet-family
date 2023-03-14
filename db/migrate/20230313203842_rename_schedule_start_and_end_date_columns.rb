class RenameScheduleStartAndEndDateColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :schedules, :start_date, :start_time
    rename_column :schedules, :end_date, :end_time
  end
end
