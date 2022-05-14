class BookingsController < ApplicationController
  # SEVEN CRUD ACTIONS
  before_action :find_booking, only: [:show, :edit, :update, :destroy]
  # before action = params not needed == DNR !

    def index
      @booking = Booking.all
    end

    def show; end

    def new
      @booking = Booking.new
      # GENERATE FORM form_for
    end

    def create
      @booking = Booking.new(booking_params)
      if booking.save redirect_to booking_path(@booking)
      else
        render :new
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
    #  not allow others to make unautherized changes
    def set_booking
      @booking = Booking.find(params[:id])
    end

    #  allow parameters
    def booking_params
      params.require(:Booking).permit(:id, :description, :location)
      # Strong params called in create see above
      # role of params is to pass info from one page to another url
    end

    def find_booking
      @booking = Booking.find(params[:id])
    end

end
