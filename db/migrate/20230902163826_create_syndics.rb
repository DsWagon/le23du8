class CreateSyndics < ActiveRecord::Migration[7.0]
  def change
    create_table :syndics do |t|
      t.string :name
      t.text :description
      t.text :address
      t.text :email
      t.integer :phone

      t.timestamps
    end
  end
end
