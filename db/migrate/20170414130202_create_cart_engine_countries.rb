class CreateCartEngineCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_engine_countries do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
