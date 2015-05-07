PostitTemplate::Application.routes.draw do
  root to: 'works#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :works do
    resources :comments, only: [:create]
  end
  resources :users, only: [:create, :show]
  resources :saints
  resources :artists
end
