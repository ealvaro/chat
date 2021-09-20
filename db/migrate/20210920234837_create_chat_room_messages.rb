class CreateChatRoomMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_room_messages do |t|
      t.references :chat_room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
