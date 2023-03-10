class Family < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :pets, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 3 }
end
