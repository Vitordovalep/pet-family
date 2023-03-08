class Pet < ApplicationRecord
  belongs_to :family
  has_many :users, through: :family

  validates :name, presence: true
end
