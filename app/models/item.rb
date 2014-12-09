class Item < ActiveRecord::Base

  belongs_to :user
  
  validates :description, presence: true

  def recent?
    created_at > 1.hour.ago
  end

end