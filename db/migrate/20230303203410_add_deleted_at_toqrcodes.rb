class AddDeletedAtToqrcodes < ActiveRecord::Migration[7.0]
  def change
   add_column :qrcodes, :deleted_at, :datetime
  end
end
