class Pet < ApplicationRecord
  belongs_to :family
  has_many :users, through: :family
  has_one_attached :photo

  validates :name, presence: true
end
