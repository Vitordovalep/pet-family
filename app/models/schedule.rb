class Schedule < ApplicationRecord
  belongs_to :pet
  belongs_to :task
  belongs_to :user

  validates :name, presence: true
end
