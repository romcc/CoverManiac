Rails.application.routes.draw do
  get 'archives/show'

  get 'archives/list'

  get 'instructions/show'

  get 'archive/show'

  resources :competitions
  resources :archives
  resources :instructions
  resources :message_boards 
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :covers do
    resources :reviews, except: [:show, :index]
    
    
  end
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


root 'covers#index'
end
