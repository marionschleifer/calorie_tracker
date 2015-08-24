class SetDefaultDatesOnEntries < ActiveRecord::Migration
  def up
    Entry.find_each do |entry|
      if entry.date.nil?
        entry.date = Date.new(2015, 8, 17)
        entry.save!
      end
    end
  end

  def down
  end
end
