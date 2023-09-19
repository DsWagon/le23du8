class Post < ApplicationRecord
  belongs_to :user
  has_many :commentaries, dependent: :destroy
  has_rich_text :content

  enum category: [:vente, :achat, :don, :news]

  def self.ransackable_attributes(auth_object = nil)
    ["category", "content", "created_at", "id", "title", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["commentaries", "rich_text_content", "user"]
  end

end
