class BookingsController < ApplicationController
  # SEVEN CRUD ACTIONS
  before_action :find_booking, only: [:show, :edit, :update, :destroy]
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
    if booking.save redirect_to booking_path(@booking)
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
    params.require(:Booking).permit(:id, :description, :location)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def future_booking
    @future_bookings = bookings.where("start_date >= '#{Date.today}'")
  end

end
