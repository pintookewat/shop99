class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  # omniauth_providers: %i[facebook]
  # devise :omniauthable
  has_many :qrcodes, dependent: :destroy
  has_many :products, dependent: :destroy



  def self.super_admin?(current_user)
    current_user.has_role? :super_admin
  end

  def self.user?(current_user)
    current_user.has_role? :user
  end


  rails_admin do
     edit do
       exclude_fields :last_sign_in_at
       exclude_fields :confirmation_sent_at
       exclude_fields :unconfirmed_email
       exclude_fields :failed_attempts
       exclude_fields :unlock_token
       exclude_fields :remember_created_at
       exclude_fields :last_sign_in_ip
       exclude_fields :sign_in_count
      exclude_fields :confirmation_token
     end
    end

  rails_admin do
    list do
      field :full_name
      field :email
      field :gender
      field :age
      field :phone
    end
  end

end
