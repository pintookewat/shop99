class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_id
      t.string :default_price
      t.string :description
      t.string :images
      t.integer :price
      t.string :name
      t.string :payment_id
      t.string :object
      t.boolean :active
      t.string :boolean
      t.string :url
      t.string :price_id
      t.string :user_id

      t.timestamps
    end
  end
end
