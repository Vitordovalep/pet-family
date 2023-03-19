class FamiliesController < ApplicationController
  before_action :set_family, only: %i[create_by_id]

  def index
    @families = policy_scope(Family)
  end

  def show
    @family = Family.find(current_user.family.id)
    authorize @family
    @user = User.find(current_user.id)
    authorize @user
  end

  def new
    @family = Family.new
    authorize @family
    @families = Family.all
  end

  # Join existing family

  def create
    @family = Family.new(family_params)
    authorize @family
    if @family.save
      current_user.update!(family: @family)
      redirect_to new_family_pet_path(@family)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create_join
    @family = Family.find(params[:family][:name])
    authorize @family
    if current_user.update!(family: @family)
      redirect_to main_page_path
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
