Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :products do
    get :destroy_product
  end
  resources :qrcodes do
    get :destroy_qr
    get :recover_qrcode_page, on: :collection
    get  :recover_qrcode
    get  :all_recover_qrcode, on: :collection
    get  :all_delete_qrcode, on: :collection
  end

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'


  resources :homeuser do
    get :add_cart, on: :member
    collection do
      get '/dashboard', to: 'homeuser#dashboard'
    end
  end
end
