class Schedule < ApplicationRecord
  belongs_to :pet
  belongs_to :task
  belongs_to :user

  validates :user_id, :task_id, :start_date, :end_date, :due_time, presence: true
end
