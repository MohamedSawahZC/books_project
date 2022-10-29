Rails.application.routes.draw do
  resources :posts
  resources :books
  resource :users, only: [:create]
  get '/logged/' , to: 'users#show'
  get '/all/' , to: 'users#index'
  delete '/users/:id' , to: 'users#destroy'
  post "/login", to: 'users#login'
end
