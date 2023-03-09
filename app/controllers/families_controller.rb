class FamiliesController < ApplicationController
  before_action :set_family, only: %i[show]
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @families = Family.all
  end

  def show
    @pets = Pet.where(family_id: @family)
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      current_user.update!(family: @family)
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def family_params
    params.require(:family).permit(:name)
  end

  def set_family
    @family = Family.find(params[:id])
  end
end
