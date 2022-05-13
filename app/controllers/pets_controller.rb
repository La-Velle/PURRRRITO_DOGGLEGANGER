class PetsController < ApplicationController

  def index
    #@pet = Pet.all
    @pet = policy_scope(Pet).order(created_at: :desc)
    @markers =@pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longditude
      }
  end

  def new
    @pet =  Pet.new(params[:pet])
    authorize @pet
  end

  def create
    @pet =  Pet.new(params[:pet])
    authorize @pet
    @pet.user = current_user
    @pet.save

    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to pets_path
  end

  def edit
    @pet = Pet.find(params[:id])
    @pet.edit(params[:pet])
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def destroy
    @pet = Pet.find(params[:id])
    authorize @pet
    @pet.destroy
    redirect_to pets_path
  end
end

private

def pet_params
  params.require(:pet).permit(:name, :description, :price, :availability)
end
