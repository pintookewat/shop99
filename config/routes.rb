Rails.application.routes.draw do
  resources :products do
    get :destroy_product
  end  
  resources :qrcodes do
    get :destroy_qr
   end 


  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users, controllers: { omniauth_callbacks: 'user/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  namespace :user do
    get '/dashboard', to: "user#dashboard"
   resources :user
  end

end
