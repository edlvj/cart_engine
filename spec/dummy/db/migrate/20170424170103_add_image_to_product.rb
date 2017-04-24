class AddImageToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :engine_products, :image, :string
  end
end
