Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users

  root 'developers#index'

  resources :users, only: [:show]
  resources :developers, only: [:show, :index, :new, :create] do
    resource :projects, only: [:new, :create]
    # post '/projects' => 'projects#create'
    # get '/projects/new' => 'projects#new'
  end

  resources :projects, only: [:index]
end
