class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # if params[:query].present?
    #     @pets = Pet.search_by_name(params[:query])
    #   else
    @pets = policy_scope(Pet).order(created_at: :desc)
    #    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])

    @booking = Booking.new
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params[:pet])
    @pet.user_id = current_user
    authorize @pet
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit
    @pet = Pet.find(params[:id])
    @pet.edit(params[:pet])
  end

  def update
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    @pet = Pet.find(params[:id])
    authorize @pet
    @pet.destroy
    redirect_to pets_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :description, :price, :availability)
  end

  def find_pet
    @pet = Pet.find(params[:id])
    authorize @pet
  end
end
