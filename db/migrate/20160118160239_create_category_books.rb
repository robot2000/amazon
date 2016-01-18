class CreateCategoryBooks < ActiveRecord::Migration
  def change
    create_table :category_books do |t|
      t.references :book
      t.references :category

      t.timestamps null: false
    end
  end
end
