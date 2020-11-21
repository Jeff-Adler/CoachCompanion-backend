class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  before_action :find_user, only: [:retrieve_user_activities, :log_activity]
 
  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end
 
  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def retrieve_user_activities
    render json: @user.activities
  end


  def log_activity
    log_activity_params
  end
 
  private
 
  def user_params
    params.require(:user).permit(:username, :password, :bio, :avatar)
  end

  def log_activity_params
    params.require(:activity).permit(:activity_id,:timestamp)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
