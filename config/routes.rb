Rails.application.routes.draw do
  root "basic_searches#index"

  # Oauth routes
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Normal entity routes
  resources :job_categories
  resources :majors
  resources :event_attendees
  resources :events
  resources :media_handles
  resources :alumni
  resources :users
  resources :roles

  # Directory routes
  resources :basic_searches, :only => [:index, :show] do
    collection do
      get :search
    end
  end
  resources :advanced_searches, :only => [:index, :show] do
    collection do
      get :search
    end
  end

  # Profile Settings route
  resources :settings, :only => [:index]
  
  # Sessions routes
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # Admin page route
  resources :admin, :only => [:index]
  post "/admin/approve" => 'admin#approve', as: :approve

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end