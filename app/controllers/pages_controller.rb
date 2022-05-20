class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  skip_before_action :authenticate_user!, only: :about

  def home
    @pets = Pet.limit(3).order('created_at DESC');
    @bookings = Booking.limit(1).order('created_at DESC');
  end

  def about
  end
end
