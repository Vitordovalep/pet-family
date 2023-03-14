class AddRecurringRuleToSchedule < ActiveRecord::Migration[7.0]
  def change
    add_column :schedules, :recurring_rule, :text
  end
end
