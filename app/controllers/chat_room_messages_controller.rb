class ChatRoomMessagesController < ApplicationController

  def create
    @chat_room_message = ChatRoomMessage
                            .create(
                              user: current_user,
                              chat_room: ChatRoom.find(params.dig(:chat_room_message, :chat_room_id)),
                              message: params.dig(:chat_room_message, :message)
                                   )
  end
end
