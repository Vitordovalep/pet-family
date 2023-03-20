class Document < ApplicationRecord
  belongs_to :pet
  has_one :family, through: :pet
  has_many :notifications, dependent: :destroy
  has_many_attached :files

  after_create :add_new_document_notification
  after_update :add_update_document_notification

  validates :name, :files, presence: true
  validates :description, length: { maximum: 120 }

  private

  def add_new_document_notification
    Notification.create(document: self, message: "Foi adicionado um novo documento: #{name} para #{pet.name}", family: pet.family)
  end

  def add_update_document_notification
    Notification.create(document: self, message: "O documento: '#{name}' de #{pet.name} foi atualizado", family: pet.family)
  end
end
