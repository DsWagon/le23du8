class Post < ApplicationRecord
  belongs_to :user
  has_many :commentaries, dependent: :destroy
  has_rich_text :content
  has_many_attached :photos

  enum category: [:news, :vente, :achat, :don]

  validates :title, presence: true
  validates :content, presence: true
end
