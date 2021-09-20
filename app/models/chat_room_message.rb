class ChatRoomMessage < ApplicationRecord
  belongs_to :chat_room, inverse_of: :chat_room_messages
  belongs_to :user
end
