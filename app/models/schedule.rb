class Schedule < ApplicationRecord
  belongs_to :pet
  belongs_to :task
  belongs_to :user
  has_many :schedule_exceptions, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :start_time, :due_time, :pet_id, :user_id, presence: true

  serialize :recurring_rule, Hash
  def recurring_rule=(value)
    if RecurringSelect.is_valid_rule?(value)
      super(RecurringSelect.dirty_hash_to_rule(value).to_hash)
    else
      super(nil)
    end
  end

  def rule
    IceCube::Rule.from_hash recurring_rule
  end

  def schedule(start)
    schedule = IceCube::Schedule.new(start)
    schedule.add_recurrence_rule(rule)
    schedule_exceptions.each do |exception|
      schedule.add_exception_time(exception.start_time)
    end
    schedule
  end

  def calendar_events(start_d, end_d)
    if recurring_rule.empty?
      [self]
    else
      schedule(start_d).occurrences(end_d).map do |date|
        Schedule.new(
          id: id,
          user: user,
          task: task,
          pet: pet,
          due_time: due_time,
          start_time: date
        )
      end
    end
  end

end
