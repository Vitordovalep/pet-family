class AddSpeciesAndBreedToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :species_id, :bigint
    add_column :pets, :breed_id, :bigint
  end
end
