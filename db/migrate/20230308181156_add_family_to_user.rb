class AddFamilyToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :family, foreign_key: true
  end
end
