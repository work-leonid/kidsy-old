Rails.application.routes.draw do
  resources :todo_items
  resources :journal_items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "journal_items#index"
end
