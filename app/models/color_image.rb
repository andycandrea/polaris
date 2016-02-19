class ColorImage < ActiveRecord::Base
  mount_uploader :file, ImageUploader

  validates :file, presence: true
  validates :image_set, presence: true

  belongs_to :image_set
end
