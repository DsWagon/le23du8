class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :meeting, dependent: :destroy
  
  validates :content, presence: true
end
