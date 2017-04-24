class CreateCartEngineShippings < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_engine_shippings do |t|
      t.string   :company
      t.string   :days
      t.decimal  :costs, default: "0.0"

      t.timestamps
    end
  end
end
