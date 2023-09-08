class Flat < ApplicationRecord
  belongs_to :user

  validates :floor, presence: true
  validates :surface, presence: true
  validates :lot, presence: true
  
end
