class Post < ApplicationRecord
  belongs_to :user
  has_many :commentaries, dependent: :destroy
end
