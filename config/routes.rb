Rails.application.routes.draw do

  root 'pages#home'
  get 'signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'links', to: 'links#index'
  get 'search', to: 'pages#search'
  get 'add', to: 'pages#add'
  post 'search', to: 'links#search'

  resources :users do
    resources :links
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
