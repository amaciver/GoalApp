class Goal < ActiveRecord::Base
  include Commentable
  
  validates :status, :user, :body, presence: true

  belongs_to :user
end
