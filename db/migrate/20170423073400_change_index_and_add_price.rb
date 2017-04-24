class ChangeIndexAndAddPrice < ActiveRecord::Migration[5.0]
  def change
    remove_column :cart_engine_coupons, :order_id_id
    remove_column :cart_engine_order_items, :order_id_id
    add_reference :cart_engine_coupons, :order, index: true
    add_reference :cart_engine_order_items, :order, index: true
    add_column :cart_engine_order_items, :price, :decimal
  end
end
