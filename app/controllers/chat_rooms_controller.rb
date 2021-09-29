class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = ChatRoom.new chat_room_params

    if @chat_room.save
      flash[:success] = "Chat Room #{@chat_room.name} was created successfully"
      redirect_to chat_rooms_path
    else
      render :new
    end
  end

  def update
    @chat_room = ChatRoom.find(params[:id]) if params[:id]
    if @chat_room.update_attributes(chat_rooms_params)
      flash[:success] = "ChatRoom #{@chat_room.name} was updated successfully"
      redirect_to chat_rooms_path
    else
      render :new
    end
  end

  def show
    @chat_rooms = ChatRoom.all
    @chat_room = ChatRoom.find(params[:id]) if params[:id]
    @chat_room_message = ChatRoomMessage.new(chat_room: @chat_room)
    @chat_room_messages = @chat_room.chat_room_messages.includes(:user)
  end

  protected

  def chat_room_params
    params.require(:chat_room).permit(:name)
  end
end
