class Entry < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :food
  validates_presence_of :calories
  validates_presence_of :date
end
