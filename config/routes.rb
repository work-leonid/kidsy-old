Rails.application.routes.draw do
  devise_for :users

  resources :todo_items
  resources :journal_items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #root "journal_items#index"
  root "home#index"
end
