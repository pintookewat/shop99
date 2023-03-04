class Qrcode < ApplicationRecord
  acts_as_paranoid 
  extend FriendlyId
  friendly_id :name, use: :slugged
  mount_uploader :file, FileUploader
  belongs_to :user
end
