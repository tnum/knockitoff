class Item < ActiveRecord::Base
  validates :description, presence: true

end