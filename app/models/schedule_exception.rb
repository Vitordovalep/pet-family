class ScheduleException < ApplicationRecord
  belongs_to :schedule

  validates :start_time, presence: true

end
