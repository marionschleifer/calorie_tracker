class Entry < ActiveRecord::Base
  validates_presence_of :food
  validates_presence_of :calories
  validates_presence_of :date
end
