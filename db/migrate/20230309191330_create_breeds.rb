class CreateBreeds < ActiveRecord::Migration[7.0]
  def change
    create_table :breeds do |t|
      t.string :name
      t.references :species, null: false, foreign_key: true

      t.timestamps
    end
  end
end
