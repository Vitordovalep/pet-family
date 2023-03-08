class Pet < ApplicationRecord
  belongs_to :family
  has_many :users, through: :family

  SPECIES = %w[dog cat rabbit]
  validates :name, presence: true
  validates :species, inclusion: { in: SPECIES }
end