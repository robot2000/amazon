class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.text :review
      t.integer :value

      t.references :book,   null: false
      t.references :user, null: false

      t.timestamps null: false
    end
  end
end
