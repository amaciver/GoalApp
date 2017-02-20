class Goal < ActiveRecord::Base
  validates :status, :user, :body, presence: true

  belongs_to :user
end
