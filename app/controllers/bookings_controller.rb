class BookingsController < ApplicationController
  # SEVEN CRUD ACTIONS
  before_action :find_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_pet, except: [:index]
  # before action = params not needed == DNR !

  def index
    @booking = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pet = @pet
    @booking.user = current_user
    if @booking.save!
      redirect_to bookings_path
    else
      render :new
    end
  end

  def update
    @booking = Booking.new(booking_params)
    redirect_to booking_path(@booking)
  end

  def delete
    @booking.destroy
    redirect_to booking_path(@booking)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit( :start_date, :end_date)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def future_booking
    @future_bookings = bookings.where("start_date >= '#{Date.today}'")
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

end
