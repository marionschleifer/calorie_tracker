class User::CalorieCalculator
  def initialize(user, date)
    @user = user
    @date = date
  end

  def daily_calories
    sum_of_calories
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
end
