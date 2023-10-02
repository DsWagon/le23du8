class Meeting < ApplicationRecord
  has_many :quotes, dependent: :destroy
  belongs_to :syndic

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :syndic_id, presence: true




end
