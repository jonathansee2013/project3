Rails.application.routes.draw do

  get 'welcome' => 'pages#welcome'

  get 'about' => 'pages#about'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'


  get  '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
