class Task < ApplicationRecord
  has_one :schedule, dependent: :destroy
  has_one :user, through: :schedule
  accepts_nested_attributes_for :schedule

  TASK_CATEGORIES = ["Banho e tosa", "Medicamento", "Consulta", "Exame", "Comida", "Passeio", "Outros"]
  validates :category, presence: true
  validates :category, inclusion: { in: TASK_CATEGORIES }
end
