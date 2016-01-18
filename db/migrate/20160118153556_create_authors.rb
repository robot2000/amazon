class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name, index: true
      t.text :biography

      t.timestamps null: false
    end
  end
end
