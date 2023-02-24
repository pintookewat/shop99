class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  # omniauth_providers: %i[facebook]
  # devise :omniauthable
  has_many :qrcodes, dependent: :destroy
  has_many :products, dependent: :destroy


  def self.find_for_facebook_outh(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    return user if user

    user = User.where(email: auth.info.email).first
    return user if user

    User.create(
      name: auth.extra.raw_info.name,
      provider: auth.provider,
      uid: auth.uid,
      email: auth.info.email,
      image_facebook: auth.info.image,
      password: Devise.friendly_token[0, 20]
    )
  end



  # def self.from_omniauth(auth)
  #   name_split = auth.info.name.split(" ")
  #   user = User.where(email: auth.info.email).first
  #   user ||= User.create!(provider: auth.provider, uid: auth.uid,  name: name_split[1], email: auth.info.email, password: Devise.friendly_token[0, 20])
  #     user
  # end
end
