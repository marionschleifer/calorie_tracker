class Entry < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :food
  validates_presence_of :date

  def info_notice?
    calories.nil?
  end
end
