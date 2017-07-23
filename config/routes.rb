Rails.application.routes.draw do

  get '/app' => 'pages#app'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resource :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
