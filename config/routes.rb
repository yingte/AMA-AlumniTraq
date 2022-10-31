# frozen_string_literal: true

Rails.application.routes.draw do
  root 'basic_searches#index'

  # Oauth routes
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Normal entity routes
  resources :job_categories
  resources :majors
  resources :event_attendees
  resources :meetings
  resources :media_handles
  resources :alumni
  resources :users
  resources :roles

  # Directory routes
  resources :basic_searches, only: %i[index show] do
    collection do
      get :search
    end
  end
  resources :advanced_searches, only: %i[index show] do
    collection do
      get :search
    end
  end

  # Sessions routes
  get 'login', to: 'sessions#new'
  resources :sessions, only: [:new] # Add this for LinkedIn omniauth
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Admin page route
  resources :admin, only: [:index]
  post '/admin/approve' => 'admin#approve', as: :approve

  # FAQ route
  resources :faq, only: [:index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
