class Schedule < ApplicationRecord
  belongs_to :pet
  belongs_to :task
  belongs_to :user

  validates :start_date, :end_date, :due_time, :pet_id, :user_id, presence: true
end
