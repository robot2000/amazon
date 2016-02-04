class CreateOrders < ActiveRecord::Migration

  def change
    create_table :orders do |t|
      t.float :total_price
      t.date :completed_date
      t.string :state
      
      t.references :user, index: true
      t.references :credit_card, index: true
      t.references :billing_address, null: false
      t.references :shipping_address, null: false
      
      t.timestamps null: false
    end
  end
end
