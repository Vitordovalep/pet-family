class Family < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :pets, dependent: :destroy

  validates :name, presence: true
end
