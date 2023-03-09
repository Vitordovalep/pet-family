class Pet < ApplicationRecord
  belongs_to :family
  has_many :users, through: :family
  has_one_attached :photo

  SPECIES = %w[Dog Cat]
  BREED = Faker::Creature::Dog.breed
  validates :name, presence: true
  validates :species, inclusion: { in: SPECIES }
  validates :breed, inclusion: { in: BREED }
end
