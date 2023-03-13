class Schedule < ApplicationRecord
  belongs_to :pet
  belongs_to :task
  belongs_to :user

  validates :start_time, :due_time, :pet_id, :user_id, presence: true

  serialize :recurring_rule, Hash
  def recurring_rule=(value)
    if RecurringSelect.is_valid_rule?(value)
      super(RecurringSelect.dirty_hash_to_rule(value).to_hash)
    else
      super(nil)
    end
  end
end
