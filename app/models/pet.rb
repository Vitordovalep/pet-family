class Pet < ApplicationRecord
  belongs_to :family
  belongs_to :breed
  has_many :schedules, dependent: :destroy
  has_one :species, through: :breed
  has_many :users, through: :family
  has_many :tasks, through: :schedule
  has_one_attached :photo
  has_many :documents, dependent: :destroy

  # SPECIES = %w[Dog Cat Horse Reptile Hamster]
  # BREED = %w[nhoquexairi daxirraund pinxi]
  # CAT_BREED = %w[siames careca aleatorio]
  validates :name, presence: true
end
