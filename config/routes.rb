Rails.application.routes.draw do

  get 'messages/index'

  get 'messages/new'

  get 'messages/create'

  get 'messages/show'

  get 'messages/destroy'

  root to: 'users#index'

  get 'welcome' => 'pages#welcome'

  get 'about' => 'pages#about'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'


  get  '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/users/search' => 'users#search'
  post '/users/result' => 'users#result'

  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
