class Qrcode < ApplicationRecord
  acts_as_paranoid 
  extend FriendlyId
  friendly_id :name, use: :slugged
  mount_uploader :file, FileUploader
  include PgSearch::Model
  pg_search_scope :search_by_name, against: :name
  belongs_to :user
end
