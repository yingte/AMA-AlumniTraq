Rails.application.routes.draw do
  root "directory#index"

  resources :job_categories
  resources :majors
  resources :event_attendees
  resources :meetings
  resources :media_handles
  resources :alumni
  resources :users
  resources :roles
  resources :directory, :only => [:index, :show] do
    collection do
      get :search
    end
  end
  resources :settings, :only => [:index]
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
