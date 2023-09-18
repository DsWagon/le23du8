class Post < ApplicationRecord
  belongs_to :user
  has_many :commentaries, dependent: :destroy
  has_rich_text :content

  enum category: [:vente, :achat, :don, :news]

end
