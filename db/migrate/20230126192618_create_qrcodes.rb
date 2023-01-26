class CreateQrcodes < ActiveRecord::Migration[7.0]
  def change
    create_table :qrcodes do |t|
      t.string :name
      t.string :image
      t.text :location

      t.timestamps
    end
  end
end
