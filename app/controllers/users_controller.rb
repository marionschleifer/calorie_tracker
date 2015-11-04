class UsersController < ApplicationController
  skip_before_action :ensure_logged_in, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def remaining_calories
    total = current_user.target_calories
    @entries.each do |entry|
      total -= entry.calories
    end
    return total
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :target_calories)
  end

end
