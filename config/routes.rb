Rails.application.routes.draw do

  root 'pages#home'
  get 'signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'link', to: 'links#index'
  post 'search', to: 'links#search'

  resources :users do
    resources :links
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
