class CreateScheduleExceptions < ActiveRecord::Migration[7.0]
  def change
    create_table :schedule_exceptions do |t|
      t.references :schedule, null: false, foreign_key: true
      t.date :time

      t.timestamps
    end
  end
end
