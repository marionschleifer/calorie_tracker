class UsersController < ApplicationController
  skip_before_action :ensure_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to entries_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to entries_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
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
    params.require(:user).permit(:name, :email, :password, :target_calories, :slack_url)
  end

end
