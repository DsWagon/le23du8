class Meeting < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :syndic
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :syndic_id, presence: true
  

end
