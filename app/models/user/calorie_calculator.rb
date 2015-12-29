class User::CalorieCalculator
  def initialize(user, date)
    @user = user
    @date = date
  end

  def daily_calories
    sum_of_calories
  end

  def weekly_calories
    sum_of_weekly_calories.to_i
  end

  def weekly_progress
    [progress_in_week, 100].min
  end

  def ideal_progress
    [calculate_ideal_progress, 100].min
  end


  private

  attr_reader :user, :date

  def target_calories
    user.target_calories.to_f
  end

  def sum_of_calories
    daily_entries.sum(:calories)
  end

  def daily_entries
    user.entries.where(date: date)
  end

  def sum_of_weekly_calories
    user.entries.where(date: date.beginning_of_week..date).sum(:calories).to_f
  end

  def progress_in_week
    (sum_of_weekly_calories / (target_calories*7) * 100).round
  end

  def calculate_ideal_progress
    (((date.beginning_of_week..date).count * target_calories) / (target_calories*7) * 100).round
  end
end
