class Task < ApplicationRecord
  has_one :schedule
  has_one :user, through: :schedule

  TASK_CATEGORIES = ["Banho e tosa", "Medicamento", "Consulta", "Exame", "Comida", "Passeio", "Outros"]
  validates :category, presence: true
  validates :category, inclusion: { in: TASK_CATEGORIES }
end
