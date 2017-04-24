class CreateEngineUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :engine_users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.timestamps
    end
  end
end
