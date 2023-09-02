class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.text :company_name
      t.text :description
      t.integer :price
      t.date :date_start
      t.date :date_end
      t.references :meeting, null: false, foreign_key: true

      t.timestamps
    end
  end
end
