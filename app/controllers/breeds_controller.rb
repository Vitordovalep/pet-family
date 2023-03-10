class BreedsController < ApplicationController
  def index
    species = Species.find(params[:species_id])
    render json: (policy_scope(Breed).where(species: species).pluck(:id, :name))
  end
end
