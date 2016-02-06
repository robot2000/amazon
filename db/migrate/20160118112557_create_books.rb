class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, index: true
      t.text :description
      t.decimal :price,      precision: 8, scale: 2
      t.integer :qty
      t.string :image, :default => '/assets/book.jpg'

      t.timestamps null: false
    end
  end
end
