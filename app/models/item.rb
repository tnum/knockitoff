class Item < ActiveRecord::Base
  validates :description, presence: true

  def days_remaining
    time_remaining = days - 1
    update_attribute(:days, time_remaining)
  end

end