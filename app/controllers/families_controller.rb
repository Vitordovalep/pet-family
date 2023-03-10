class FamiliesController < ApplicationController
  before_action :set_family, only: %i[show]

  def index
    @families = policy_scope(Family)
  end

  def show
    authorize @family
    @pets = Pet.where(family_id: @family)
  end

  def new
    @family = Family.new
    authorize @family
    @families = Family.all
  end

  def create
    @family = Family.new(family_params)
    authorize @family
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
