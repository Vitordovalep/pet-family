class RemoveSpeciesAndBreedFromPets < ActiveRecord::Migration[7.0]
  def change
    remove_column :pets, :species, :string
    remove_column :pets, :breed, :string
  end
end
