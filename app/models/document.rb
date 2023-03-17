class Document < ApplicationRecord
  belongs_to :pet
  has_one :family, through: :pet
  has_many :notifications, dependent: :destroy
  has_many_attached :files

  after_create :add_document_notification

  validates :name, :files, presence: true
  validates :description, length: { maximum: 120 }

  private

  def add_document_notification
    Notification.create(document: self, message: "Foi adicionado um novo documento: #{name}", family: pet.family)
  end
end
