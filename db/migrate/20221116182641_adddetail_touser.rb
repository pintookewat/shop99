class AdddetailTouser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :gender, :string 
    add_column :users, :phone, :integer
    add_column :users, :proffesion, :string        
  end
end
