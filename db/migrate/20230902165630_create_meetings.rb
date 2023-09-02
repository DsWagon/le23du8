class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.text :title
      t.text :description
      t.date :date
      t.references :syndic, null: false, foreign_key: true
      t.timestamps
    end
  end
end
