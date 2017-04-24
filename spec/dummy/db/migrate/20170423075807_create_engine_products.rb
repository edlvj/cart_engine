class CreateEngineProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :engine_products do |t|
      t.string :title
      t.decimal :price
      
      t.timestamps
    end
  end
end
