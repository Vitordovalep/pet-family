class Document < ApplicationRecord
  belongs_to :pet
  has_one :family, through: :pet
  has_many_attached :files

  validates :name, :files, presence: true
  validates :description, length: { maximum: 120 }
end
