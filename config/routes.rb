Rails.application.routes.draw do
  resources :qrcodes


  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  namespace :user do
    get '/dashboard', to: "user#dashboard"
   resources :user
  end

end
