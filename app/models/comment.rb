class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :meeting, dependent: :destroy
  belongs_to :quote, dependent: :destroy

  validates :content, presence: true
end
