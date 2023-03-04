class Addcheckboxlisttoqrcodes < ActiveRecord::Migration[7.0]
  def change
    add_column :qrcodes, :checkbox_list, :string
  end
end
