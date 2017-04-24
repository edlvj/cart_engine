class CreateCartEngineOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_engine_order_items do |t|
      t.integer :qty
      t.references :order_id, index: true
      t.references :productable, polymorphic: true,
                                 index: { name: 'index_engine_productable' }
      t.timestamps
    end
  end
end
