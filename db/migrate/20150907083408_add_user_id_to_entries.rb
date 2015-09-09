class AddUserIdToEntries < ActiveRecord::Migration
  def change
    user = User.first
    add_column :entries, :user_id, :integer, default: user.id, null: false
    change_column :entries, :user_id, :integer, default: nil
  end
end
