Rails.application.routes.draw do


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

  # get 'messages/index' => 'messages#index'
  # get 'messages/new' => 'messages#new'
  # get 'messages/create' => 'messages#create'
  # get 'messages/:id' => 'messages#show'
  # get 'messages/destroy' => 'messages#destroy'

  resources :users
  resources :messages, :except => [:new, :create]

  get "/messages/:receiver_id/new" => 'messages#new', :as => "new_message"
  post "/messages/:receiver_id/send" => 'messages#create', :as => "send_message"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
