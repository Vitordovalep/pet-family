class PetsController < ApplicationController
  before_action :set_family, only: %i[new create]
  before_action :set_pet, only: %i[edit update destroy]

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.family = @family
    if @pet.save
      redirect_to family_path(@family)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @pet.update(pet_params)
      redirect_to @pet.family, notice: "Pet was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pet.destroy
    redirect_to family_path(@pet.family)
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species_id, :birthday, :breed_id)
  end

  def set_family
    @family = Family.find(params[:family_id])
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
