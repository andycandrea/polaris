class Image < ActiveRecord::Base
  mount_uploader :file, ImageUploader
  validates :file, :image_set, :filter, presence: true

  belongs_to :image_set, inverse_of: :images
  belongs_to :filter
end
