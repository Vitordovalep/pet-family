class Task < ApplicationRecord
  has_one :schedule, dependent: :destroy
  has_one :user, through: :schedule
  accepts_nested_attributes_for :schedule

  TASK_CATEGORIES = ["Banho e tosa", "Comida", "Consulta", "Exame", "Medicamento", "Passeio", "Outros"]
  validates :category, presence: true
  validates :category, inclusion: { in: TASK_CATEGORIES }

  after_create :add_new_task_notification

  private

  def add_new_task_notification
    Notification.create(schedule: self.schedule, message: "Você é responsável por uma nova tarefa: '#{category}' para o seu pet #{schedule.pet.name} ", user: schedule.user, family: schedule.user.family)
  end
end
