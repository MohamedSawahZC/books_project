Rails.application.routes.draw do
  resources :posts
  resources :books
  resource :users, only: [:create]
  post "/login", to: 'users#login'
end
