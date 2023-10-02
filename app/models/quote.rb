class Quote < ApplicationRecord
  belongs_to :meeting

  validates :company_name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true
end
