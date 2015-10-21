class SetDefaultTargetCaloriesOnUsers < ActiveRecord::Migration
  def up
    User.find_each do |user|
      if user.target_calories.nil?
        user.target_calories = 1800
        user.save!
      end
    end
  end

  def down
  end
end
