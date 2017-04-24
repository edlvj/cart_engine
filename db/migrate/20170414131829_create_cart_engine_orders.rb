class CreateCartEngineOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_engine_orders do |t|
      t.decimal  :total_price, precision: 10, scale: 2
      t.integer  :user_id
      t.integer  :shipping_id
      t.string   :aasm_state
      t.date     :confirmed_date
      t.string   :credit_card_id
      
      t.timestamps
    end
  end
end
