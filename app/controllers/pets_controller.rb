class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # if params[:query].present?
    #     @pets = Pet.search_by_name(params[:query])
    #   else
    @pets = policy_scope(Pet).order(created_at: :desc)
    #    @pets = Pet.all
    # end


    # @markers = @pets.geocoded.map do |pet|
    #   {
    #     lat: pet.latitude,
    #     lng: pet.longitude,
    #     info_window: render_to_string(partial: "info_window", locals: { pet: pet }),
    #     image_url: helpers.asset_url("https://cdn5.vectorstock.com/i/1000x1000/47/94/dinosaur-excavation-icon-vector-16674794.jpg")
    #   }
    # end

    if params[:query].present?
     # @pets = (params[:query])
     # if @pets.empty?
      #  redirect_back(fallback_location: root_path)
       # flash[:alert] = "pet not found :("
      #end
    #else
     # @pets = Pet.all
    #end

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
