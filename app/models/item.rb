class Item < ActiveRecord::Base
  validates :description, presence: true

  def recent?
    created_at > 1.hour.ago
  end

end