class AddUserIdToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :user_id, :integer
    if User.any?
      Entry.update_all(user_id: User.first.id)
    else
      Entry.delete_all
    end
    change_column_null :entries, :user_id, false
  end
end
