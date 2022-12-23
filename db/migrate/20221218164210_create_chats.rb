class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.string :message
      t.string :name
      t.references :chatroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
