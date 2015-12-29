class Entry < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :food
  validates_presence_of :date
  before_create :set_position_number

  def info_notice?
    calories.nil?
  end

  private

  def set_position_number
    self.position = maximum_position + 1
  end

  def maximum_position
    Entry.where(user_id: user_id, date: date).maximum(:position) || 0
  end
end
