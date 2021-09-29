class ChatRoomMessagesController < ApplicationController

  def create
    @chat_room = ChatRoom.find(params.dig(:chat_room_message, :chat_room_id))
    @chat_room_message = ChatRoomMessage
                            .create(
                              user: current_user,
                              chat_room: @chat_room,
                              message: params.dig(:chat_room_message, :message)
                                   )

    ChatRoomChannel.broadcast_to @chat_room, @chat_room_message
  end
end
