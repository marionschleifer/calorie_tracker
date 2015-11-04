class User::CalorieCalculator
  def initialize(user, date)
    @user = user
    @date = date
  end

  def remaining
    target_calories - daily_calories
  end


  private

  attr_reader :user, :date

  def target_calories
    user.target_calories
  end

  def daily_calories
    daily_entries.sum(:calories)
  end

  def daily_entries
    user.entries.where(date: date)
  end
end
