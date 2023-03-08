class Pet < ApplicationRecord
  belongs_to :family
  has_many :users, through: :family
  has_one_attached :photo

  SPECIES = %w[dog cat rabbit]
  validates :name, presence: true
  validates :species, inclusion: { in: SPECIES }
end
