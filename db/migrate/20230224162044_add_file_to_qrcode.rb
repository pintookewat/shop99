class AddFileToQrcode < ActiveRecord::Migration[7.0]
  def change
    add_column :qrcodes, :file, :string
  end
end
