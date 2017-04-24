class CreateCartEngineCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_engine_coupons do |t|
      t.integer :discount
      t.string :code, index: true
      t.references :order_id, index: true

      t.timestamps
    end
  end
end
