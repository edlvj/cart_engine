class AddOrederToCrefitCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cart_engine_credit_cards, :order_id, :integer
  end
end
