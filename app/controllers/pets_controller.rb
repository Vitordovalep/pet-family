class PetsController < ApplicationController
  before_action :set_family, only: %i[new create]
  before_action :set_pet, only: %i[edit update destroy]

  def show
    @pets = Pet.where(family: current_user.family)
    authorize @pets
    @family = Family.find(current_user.family_id)
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    authorize @pet
    @pet.family = @family
    if @pet.save
      redirect_to main_page_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @pet
  end

  def update
    authorize @pet
    if @pet.update(pet_params)
      redirect_to main_page_path, notice: "Pet was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @pet
    @pet.destroy
    redirect_to main_page_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :birthday, :breed_id, :photo)
  end

  def set_family
    @family = Family.find(params[:family_id])
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
