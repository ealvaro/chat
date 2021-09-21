Rails.application.routes.draw do
  devise_for :users
  root controller: :chat_rooms, action: :index
  resources :chat_room_messages
  resources :chat_rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
