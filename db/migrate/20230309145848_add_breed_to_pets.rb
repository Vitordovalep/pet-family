class AddBreedToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :breed, :string
  end
end
