class Qrcode < ApplicationRecord
  acts_as_paranoid 
  mount_uploader :file, FileUploader
  belongs_to :user
end
