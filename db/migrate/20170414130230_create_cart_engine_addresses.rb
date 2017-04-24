class CreateCartEngineAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_engine_addresses do |t|
      t.string   :firstname
      t.string   :lastname
      t.string   :address
      t.string   :zipcode
      t.string   :city
      t.string   :phone
      t.integer  :order_id
      t.integer  :user_id
      t.string   :addressable_type
      t.integer  :country_id

      t.timestamps
    end
  end
end
