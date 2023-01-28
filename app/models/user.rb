class User < ApplicationRecord
  mount_uploader :image, ImageUploader 
    
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates_integrity_of  :image
  validates_processing_of :image
  has_many :qrcodes, :dependent => :destroy
  has_many :shops, :dependent => :destroy
  private
    def avatar_size_validation
      errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end      
end 
