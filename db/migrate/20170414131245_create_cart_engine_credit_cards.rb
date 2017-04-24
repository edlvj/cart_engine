class CreateCartEngineCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_engine_credit_cards do |t|
      t.string   :name
      t.string   :number
      t.string   :cvv
      t.integer  :user_id, index: true
      t.string   :expiration_date

      t.timestamps
    end
  end
end
