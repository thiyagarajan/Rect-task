Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  devise_scope :user do
    get '/signup' => 'devise/registrations#new'
    get '/login' => 'devise/sessions#new'
    get '/forgot_password' => 'devise/passwords#new'
  end

  root 'developers#index'

  resources :users, only: [:show]
  resources :developers, only: [:show, :index, :new, :create] do
    resource :projects, only: [:new, :create]
    # post '/projects' => 'projects#create'
    # get '/projects/new' => 'projects#new'
  end

  resources :projects, only: [:index]
end
