class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    json_response(@users) #make sure its similar to lessonly docs
  end

  def show
    @user = User.find(params[:id])
    json_response(@user)
  end

  def create
    @user = User.new(user_params)
    json_response(@user) if @user.save
  end

  def assignments
    @user = User.find(params[:id])
    @assignments = User.assignments
    json_response(@assignments)#make this into json value with same values of lessonly docs JSON.parse belongs in other end of api
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
    :password_confirmation)
  end
end
