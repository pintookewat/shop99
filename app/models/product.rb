class Product < ApplicationRecord
  belongs_to :user
  mount_uploader :images, ImageUploader

  private

  def avatar_size_validation
    errors[:image] << 'should be less than 500KB' if image.size > 0.5.megabytes
  end
end
