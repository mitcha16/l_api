class UsersController < ApplicationController
  def index
    @users = User.all
    json_response(@users)
  end

  def show
    @user = User.find(params[:id])
    json_response(@user)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Thanks for signing up!"
      json_response(@user)
    else
      flash[:error] = "There was a problem creating your account"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
    :password_confirmation)
  end
end
