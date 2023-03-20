class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.text :message
      t.references :schedule, null: true, foreign_key: true
      t.references :document, null: true, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.references :family, null: false, foreign_key: true
      t.datetime :read_at
      t.timestamps
    end
  end
end
