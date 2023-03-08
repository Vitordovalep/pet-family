class PetsController < ApplicationController
  before_action :set_family, only: %i[new show]

  def index
    @pets = Pet.all
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def show

  end

  def destroy

  end

  private

  def pet_params

  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
