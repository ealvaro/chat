Rails.application.routes.draw do
  root controller: :chat_rooms, action: :index
  resources :chat_room_messages
  resources :chat_rooms
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
