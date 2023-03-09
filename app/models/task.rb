class Task < ApplicationRecord
  has_one :schedule
  has_one :user, through: :schedule

  validates :user_id, :task_id, :start_date, :end_date, :due_time, presence: true
end
