class PetsController < ApplicationController
  def index
    @pet = Pet.all
  end

  def create
    @pet = Pet.new(params[:pet])
    @pet.save
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to pet_path(@pet)
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
    @pet.destroy
    redirect_to pets_path
  end
end

private

def pet_params
  params.require(:pet).permit(:name, :description, :price, :availability)
end
