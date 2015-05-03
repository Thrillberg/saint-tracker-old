PostitTemplate::Application.routes.draw do
  root to: 'works#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :works do
    resources :comments
  end
  resources :users
  resources :saints
  resources :artists
end
