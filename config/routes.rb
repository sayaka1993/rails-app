Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles
  root "articles#index"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "signup" => "users#new"

  post "users/create" => "users#create"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  get "users/index" => "users#index"
  post "users/:id/destroy" => "users#destroy"
end
