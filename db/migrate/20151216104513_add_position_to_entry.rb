class AddPositionToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :position, :integer

    Entry.all.each_with_index do |entry, i|
      entry.position = i
      entry.save!
    end

    change_column_null :entries, :position, false
  end
end
