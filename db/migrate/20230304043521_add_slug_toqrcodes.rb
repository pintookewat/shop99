class AddSlugToqrcodes < ActiveRecord::Migration[7.0]
  def change
    add_column :qrcodes, :slug, :string, unique: true
  end
end
