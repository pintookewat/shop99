class User < ApplicationRecord
 
    
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :qrcodes, :dependent => :destroy
  has_many :products, :dependent => :destroy
      
end 
