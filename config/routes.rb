<<<<<<< HEAD
Rails.application.routes.draw do
  root "users#index"

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
=======
Rails.application.routes.draw do
  root "directory#index"

  resources :event_attendees
  resources :events
  resources :media_handles
  resources :alumni
  resources :users
  resources :role_permissions
  resources :permissions
  resources :roles
  resources :directory, :only => [:index, :show] do
    collection do
      get :search
    end
  end
  resources :settings, :only => [:index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
>>>>>>> c93d7b1492c3d463ab2e70b16dff33b30afea34d
