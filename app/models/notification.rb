class Notification < ApplicationRecord
  belongs_to :schedule, optional: true
  belongs_to :document, optional: true
  belongs_to :user, optional: true
  belongs_to :family
end
