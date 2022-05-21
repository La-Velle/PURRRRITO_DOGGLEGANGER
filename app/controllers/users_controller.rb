class UsersController < ApplicationController
  def show
    @user = User
    sign_out :user
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to :sessions_new
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def user_pets
    @pets = Pet.where(user_id: current_user)
  end

end
