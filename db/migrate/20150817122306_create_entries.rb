class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :food
      t.integer :calories

      t.timestamps null: false
    end
  end
end
