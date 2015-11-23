class User < ActiveRecord::Base
  has_many :entries, dependent: :delete_all
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  def entries_of_today
    entries.where(date: Date.today)
  end
end
