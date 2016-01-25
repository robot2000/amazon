class CreateOrders < ActiveRecord::Migration
  drop_table :orders

  def change
    create_table :orders do |t|
      t.float :total_price
      t.date :completed_date
      t.string :state
      
      t.references :customer, foreign_key: true
      t.references :credit_card, foreign_key: true
      t.references :billing_address, null: false
      t.references :shipping_address, null: false
      
      t.timestamps null: false
    end
  end
end
