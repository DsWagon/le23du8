class Meeting < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :syndic
end
