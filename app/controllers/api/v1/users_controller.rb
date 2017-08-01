class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    {users: json_response(@users)}.to_json  #to format similarly to lessonly docs
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
    {assignments: json_response(@assignments)}.to_json 
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
    :password_confirmation)
  end
end
