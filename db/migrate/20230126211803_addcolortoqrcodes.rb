class Addcolortoqrcodes < ActiveRecord::Migration[7.0]
  def change
    add_column :qrcodes, :user_id, :integer
    add_column :qrcodes, :color, :integer
  end
end
