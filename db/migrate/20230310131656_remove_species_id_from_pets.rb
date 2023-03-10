class RemoveSpeciesIdFromPets < ActiveRecord::Migration[7.0]
  def change
    remove_column :pets, :species_id
  end
end
