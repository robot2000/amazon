class ChangeBookModel < ActiveRecord::Migration
  def change
    rename_column(:books, :in_stock, :qty)
  end
end
