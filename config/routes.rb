Rails.application.routes.draw do
  root "directory#index"

  resources :event_attendees
  resources :events
  resources :media_handles
  resources :alumni
  resources :users
  resources :calendarevents
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
