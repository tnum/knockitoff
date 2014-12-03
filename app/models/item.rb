class Item < ActiveRecord::Base
  validates :description, presence: true

  # def self.days_remaining
    # time_remaining = days - 1
    # update_attribute(:days, time_remaining)
  # end

end