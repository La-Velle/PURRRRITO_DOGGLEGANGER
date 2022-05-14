class PetsController < ApplicationController

  def index
    #@pet = Pet.all
    @pets = policy_scope(Pet).order(created_at: :desc)
    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        info_window: render_to_string(partial: "info_window", locals: { pet: pet }),
        image_url: helpers.asset_url("https://cdn5.vectorstock.com/i/1000x1000/47/94/dinosaur-excavation-icon-vector-16674794.jpg")
      }
    end
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

  private

  def pet_params
    params.require(:pet).permit(:name, :description, :price, :availability)
  end
end
