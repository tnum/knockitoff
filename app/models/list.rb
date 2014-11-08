class List < ActiveRecord::Base

  belongs_to :user
  has_many :items dependent: :restrict_with_exception

  validates :user_id, presence: true
end
