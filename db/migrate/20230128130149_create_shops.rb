class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.integer :price
      t.string :descripition
      t.string :image

      t.timestamps
    end
  end
end
