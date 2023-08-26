Rails.application.routes.draw do
  get '/affirmations', to: 'static#affirmations'

  devise_for :users

  resources :todo_items
  resources :journal_items
  
  devise_scope :user do
    get 'users/account', to: 'users/registrations#account', as: :user_account
  end

  # Defines the root path route ("/")
  #root "journal_items#index"
  root "home#index"
end
