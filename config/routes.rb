Rails.application.routes.draw do
  resources :todos do
    patch :change_status, on: :member
    patch :update_to_today, on: :member
    patch :not_to_today, on: :member
    patch :update_to_tomorrow, on: :member
  end

  get '/affirmations', to: 'static#affirmations'

  devise_for :users

  resources :todo_items
  resources :journal_items
  
  devise_scope :user do
    get 'users/account', to: 'users/registrations#account', as: :user_account
  end

  # Defines the root path route ("/")
  root "todos#index"
 # root "home#index"
end
