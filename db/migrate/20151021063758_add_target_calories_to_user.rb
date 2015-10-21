class AddTargetCaloriesToUser < ActiveRecord::Migration
  def change
    add_column :users, :target_calories, :integer
  end
end
