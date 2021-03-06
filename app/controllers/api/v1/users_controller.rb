class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  before_action :find_user, only: [:retrieve_user_activities, :log_activity, :retrieve_weekly_activities, :retrieve_weekly_tally, :submit_activity]
 
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
    log = @user.logs.create!(activity_id: log_activity_params[:activity_id], timestamp: log_activity_params[:timestamp])
    if log.valid?
      render json: { log: log }, status: :created
    else
      render json: { error: 'failed to create log' }, status: :not_acceptable
    end
  end
 
  def retrieve_weekly_activities
    render json: Log.filter_logs_by_current_week(@user.logs)
  end

  def retrieve_weekly_tally
    render json: @user.get_weekly_tally
  end

  def submit_activity
    activity = @user.activities.create!(submit_activity_params)
    if activity.valid?
      render json: { activity: activity }, status: :created
    else
      render json: { error: 'failed to create activity' }, status: :not_acceptable
    end
  end

  private
 
  def user_params
    params.require(:user).permit(:username, :password, :bio, :avatar)
  end

  def log_activity_params
    params.require(:activity).permit(:activity_id,:timestamp)
  end

  def submit_activity_params
    params.require(:activity).permit(:title,:point_value,:category,:audible,:energy_type)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
