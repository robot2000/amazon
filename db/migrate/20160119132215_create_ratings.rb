class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.text :review
      t.integer :value

      t.references :book,   null: false
      t.references :customer, null: false

      t.timestamps null: false
    end
  end
end
