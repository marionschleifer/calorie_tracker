class User::CalorieCalculator
  def initialize(user, date)
    @user = user
    @date = date
  end

  def daily_calories
    sum_of_calories
  end

  def weekly_calories
    sum_of_weekly_calories
  end

  def weekly_progress
    # 0-100
  end

  def ideal_progress
    # 0-100
  end




  private

  attr_reader :user, :date

  def target_calories
    user.target_calories
  end

  def sum_of_calories
    daily_entries.sum(:calories)
  end

  def daily_entries
    user.entries.where(date: date)
  end

  def sum_of_weekly_calories
    user.entries.where(date: date.beginning_of_week..date).sum(:calories)
  end
end
