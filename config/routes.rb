Rails.application.routes.draw do
  resources :event_attendees
  resources :events
  resources :media_handles
  resources :alumni
  resources :users
  resources :role_permissions
  resources :permissions
  resources :roles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
