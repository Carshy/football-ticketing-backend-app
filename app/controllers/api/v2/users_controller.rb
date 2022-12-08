class Api::V2::UsersController < ApplicationController
  def index
    @user = User.all
    render json: @user, status: :created
  end
  
  def create
    @db_user = User.where(name: params[:name])
    if @db_user.exists?
      render json: 'Error, user exist', status: :unprocessable_entity
    else
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  def authenticate
    @db_user = User.where(name: params[:name])
    if @db_user.exists?
      render json: @db_user, status: :created
    else
      render json: 'Error, user does not exist, please create the user', status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
