class AddQuoteToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :quote, foreign_key: true, null: false
  end
end
