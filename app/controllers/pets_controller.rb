class PetsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
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

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new(params[:pet])
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params[:pet])
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
end
